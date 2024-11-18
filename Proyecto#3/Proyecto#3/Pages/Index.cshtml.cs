using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.Data;

public class IndexModel : PageModel
{
    private readonly IConfiguration _configuration;
    public List<TareaModel> Tareas { get; set; }
    public List<int> MontoPagadoPorMes { get; set; } = new List<int>();
    public List<string> Meses { get; set; } = new List<string>();
    public List<string> Meses2 { get; set; } = new List<string>();
    public List<string> Planillas { get; set; }
    public List<string> Departamentos { get; set; }
    public List<int> MontoPagadoPorMesDEP { get; set; }
    public List<string> MesesDep { get; set; }

    public List<string> BodegasMOV { get; set; }
    public List<int> CantidadMOV { get; set; }
    public List<string> NombreFamilia { get; set; }
    public List<decimal> MontoFamilia { get; set; }

    public List<string> NombreSector { get; set; }
    public List<string> DescripcionSector { get; set; }
    public List<decimal> MontoSector { get; set; }

    public List<string> NombreZona { get; set; }
    public List<string> DescripcionZona { get; set; }
    public List<decimal> MontoZona{ get; set; }

    public List<decimal> VentasDEP{ get; set; }
    public List<decimal> CotizacionesDEP { get; set; }
    public List<string> DeparmentosJuntos { get; set; }
    public List<string> coloresVentas { get; set; }
    public List<string> coloresCotizaciones { get; set; }
    public List<decimal> VentasDEP2 { get; set; }
    public List<string> DEPVENTAS2 { get; set; }
    public List<TopCliente> Clientes { get; set; }
    public List<ZonaModel> Zona { get; set; }
    public List<VentasCotizaciones> ventasCot { get; set; }
    public List<TareaModel2> Tareas2 { get; set; }
    public List<string> bodegas { get; set; }
    public List<int> cantidades { get; set; }

    public List<Bodegas> bodegasList { get; set; }






    public IndexModel(IConfiguration configuration)
    {
        _configuration = configuration;
        Departamentos = new List<string>();  
        MontoPagadoPorMesDEP = new List<int>();  
        MesesDep = new List<string>();
        BodegasMOV = new List<string>();
        CantidadMOV = new List<int>();
        NombreFamilia = new List<string>();
        MontoFamilia = new List<decimal>();
        NombreSector = new List<string>();
        DescripcionSector = new List<string>();
        MontoSector = new List<decimal>();
        Meses2 = new List<string>();
        NombreZona = new List<string>();
        DescripcionZona = new List<string>();
        MontoZona = new List<decimal>();
        VentasDEP = new List<decimal>();
        CotizacionesDEP = new List<decimal>();
        coloresVentas = new List<string>();
        coloresCotizaciones = new List<string>();
        VentasDEP2 = new List<decimal>();
        DEPVENTAS2 = new List<string>();
        Zona = new List<ZonaModel>();
        Clientes = new List<TopCliente>();
        Tareas2 = new List<TareaModel2>();
        bodegas = new List<string>();
        cantidades = new List<int>();
        bodegasList = new List<Bodegas>();


    }

    public async Task OnPostAsync()
    {
        Tareas = new List<TareaModel>();

        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            await connection.OpenAsync();
            SqlCommand command = new SqlCommand("SELECT * FROM verTop15Tareas", connection);
            SqlDataReader reader = await command.ExecuteReaderAsync();
            while (await reader.ReadAsync())
            {
                Tareas.Add(new TareaModel
                {
                    CodigoTareaPer = reader.IsDBNull(0) ? null : reader.GetString(0),
                    TipoTareaCotizacion = reader.IsDBNull(1) ? null : reader.GetString(1),
                    TipoTareaCaso = reader.IsDBNull(2) ? null : reader.GetString(2),
                    Fecha = reader.IsDBNull(3) ? (DateTime?)null : reader.GetDateTime(3),
                    Descripcion = reader.IsDBNull(4) ? null : reader.GetString(4),
                    Estado = reader.IsDBNull(5) ? null : reader.GetString(5)
                });
            }
        }
    }




    public async Task<IActionResult> OnPostShowPagoPlanillasAsync(DateOnly fechaPago20, string formatoFecha, DateOnly? fechaPago2)
    {
        // Inicializa las listas que almacenaron los datos de la consulta
        Console.WriteLine("Entre");
        MontoPagadoPorMes = new List<int>();
        Meses = new List<string>();
        Planillas = new List<string>();

        // Establece una conexion con la base de datos
        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            // Abre la conexion de manera asincrona
            await connection.OpenAsync();

            // Convierte la fecha proporcionada a un objeto DateTime
            DateTime fecha = DateTime.Parse(fechaPago20.ToString());
            // Si la fecha de pago final es proporcionada, la convierte a formato de cadena
            string fechaFin = fechaPago2.HasValue ? fechaPago2.Value.ToString("yyyy-MM-dd") : null;

            //Prepara la consulta sql con parametros
            SqlCommand command = new SqlCommand(
                "SELECT Planilla, FechaPlanilla, MontoPagado FROM dbo.pagosplanilla(@fecha, @tipo, @fechaFin)",
                connection
            );
            command.Parameters.AddWithValue("@fecha", fecha.ToString("yyyy-MM-dd"));
            command.Parameters.AddWithValue("@tipo", formatoFecha);
            command.Parameters.AddWithValue("@fechaFin", (object?)fechaFin ?? DBNull.Value);

            // Ejecuta la consulta y obtiene los resultados

            SqlDataReader reader = await command.ExecuteReaderAsync();
            // Procesa cada fila obtenida de la consulta

            while (await reader.ReadAsync())
            {
                string mesAnio = string.Empty;
                // Dependiendo del formato de fecha, construye el valor de mes/año

                if (formatoFecha == "mes-año")
                {
                    mesAnio = $"{fecha.Month}/{fecha.Year}";
                }
                else if (formatoFecha == "año-mes")
                {
                    mesAnio = $"{fecha.Year}/{fecha.Month}";
                }
                else if (formatoFecha == "mes(año)")
                {
                    mesAnio = $"{fecha.Month}({fecha.Year})";
                }
                else if (formatoFecha == "RangoFecha" && !reader.IsDBNull(1))
                {
                    mesAnio = DateTime.Parse(reader.GetDateTime(1).ToString()).ToString("yyyy-MM-dd");
                }

                Meses.Add(mesAnio);

                Planillas.Add(reader.IsDBNull(0) ? "Sin Código" : reader.GetString(0));
                MontoPagadoPorMes.Add(reader.IsDBNull(2) ? 0 : reader.GetInt32(2));
            }
        }

        return Page();
    }



    public async Task<IActionResult> OnPostShowPagoPlanillasDEPA(DateOnly fechaPago, string formatoFecha2, DateOnly? fechaPago2)
    {
        Console.WriteLine($"fechaPago: {fechaPago}");
        Console.WriteLine($"formatoFecha2: {formatoFecha2}");
        Console.WriteLine($"fechaPago2: {fechaPago2}");

        string? fechaFinFormatted = null;

        // Si la fecha de pago final es proporcionada, la convierte a formato de cadena

        if (fechaPago2.HasValue)
        {
            fechaFinFormatted = fechaPago2.Value.ToString("yyyy-MM-dd");
        }

        Console.WriteLine($"fechaFinFormatted: {fechaFinFormatted ?? "null"}");
        //Limpie las listas previas
        Departamentos.Clear();
        MontoPagadoPorMesDEP.Clear();

        //establece una conexion con la base de datos
        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            //Abre la conexión de manera asincrona
            await connection.OpenAsync();

            // Prepara la consulta SQL con parametros
            SqlCommand command = new SqlCommand("SELECT * FROM pagosplanilladep(@mes, @tipo, @fechafin)", connection);

            command.Parameters.Add(new SqlParameter("@mes", SqlDbType.Date) { Value = fechaPago });
            command.Parameters.Add(new SqlParameter("@tipo", SqlDbType.VarChar) { Value = formatoFecha2 });
            command.Parameters.Add(new SqlParameter("@fechafin", SqlDbType.Date) { Value = (object)fechaFinFormatted ?? DBNull.Value });

            //ejecuta la consulta y obtiene los resultados
            SqlDataReader reader = await command.ExecuteReaderAsync();

            //Procesa cada fila obtenida de la consulta
            while (await reader.ReadAsync())
            {
                   //Agrega los valores obtenidos a las listas
                string nombreDepartamento = reader.IsDBNull(0) ? "Sin nombre" : reader.GetString(0);
                int montoPagado = reader.IsDBNull(1) ? 0 : reader.GetInt32(1);

                Departamentos.Add(nombreDepartamento);
                MontoPagadoPorMesDEP.Add(montoPagado);
            }
            Console.WriteLine("Departamentos:");
            foreach (var departamento in Departamentos)
            {
                Console.WriteLine(departamento);
            }

            Console.WriteLine("MontoPagadoPorMesDEP:");
            foreach (var monto in MontoPagadoPorMesDEP)
            {
                Console.WriteLine(monto);
            }

        }

        return Page();
    }








    public async Task<IActionResult> OnPostShowVerTipoMovimiento(
        string tipoMovimiento,
        DateOnly? fechaPago47,
        string? formatoFecha47,
        DateOnly? fechaPago48 = null)
    {
        try
        {
            List<string> bodegas = new List<string>();// lista para almacenar los nombres de las bodegas.
            List<int> cantidades = new List<int>();// lista para almacenar las cantidades.

            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                await connection.OpenAsync();
                SqlCommand command;
                //selecciona la consulta SQL adecuada segun el tipo de movimiento
                if (tipoMovimiento == "Entrada")
                {
                    command = new SqlCommand("SELECT * FROM tipoMovimientoM(@tipo, @fecha, @fin)", connection);
                }
                else if (tipoMovimiento == "Salida")
                {
                    command = new SqlCommand("SELECT * FROM tipoMovimientoS(@tipo, @fecha, @fin)", connection);
                }
                else
                {
                    return BadRequest("Tipo de movimiento no reconocido.");
                }
                //Configura los parametros de consulta
                command.Parameters.AddWithValue("@tipo", string.IsNullOrEmpty(formatoFecha47) ? (object)DBNull.Value : formatoFecha47);
                command.Parameters.AddWithValue("@fecha", fechaPago47.HasValue ? (object)fechaPago47.Value : DBNull.Value);
                command.Parameters.AddWithValue("@fin", fechaPago48.HasValue ? (object)fechaPago48.Value : DBNull.Value);

                //Ejecuta la consulta SQL
                SqlDataReader reader = await command.ExecuteReaderAsync();

                //Lee los resultados y los agrega a las listas correspondientes
                while (await reader.ReadAsync())
                {
                    string codigoBodega = reader.IsDBNull(0) ? "Sin código" : reader.GetString(0);
                    int monto = reader.IsDBNull(1) ? 0 : reader.GetInt32(1);

                    bodegas.Add(codigoBodega);
                    cantidades.Add(monto);
                }
            }
            //Pasa a los resultados a la vista
            ViewData["Bodegas"] = bodegas;
            ViewData["Cantidades"] = cantidades;

            return Page();
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
            return StatusCode(500, "Hubo un error al procesar la solicitud.");
        }
    }



    public async Task<IActionResult> OnPostShowTopFamilias(DateOnly fechaPago3, string formatoFecha3, DateOnly? fechaPago4)
    {
        Console.WriteLine("Entre");

        //Establece la conexion con la base de datos
        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            await connection.OpenAsync();
            // Configura la consulta SQL para obtener las familias y los montos vendidos.

            SqlCommand command = new SqlCommand("SELECT * FROM FamiliaArt(@tipo, @fecha, @fechafin)", connection);
            command.Parameters.AddWithValue("@tipo", formatoFecha3);  
            command.Parameters.AddWithValue("@fecha", fechaPago3);  
            if (fechaPago4.HasValue)  
            {
                command.Parameters.AddWithValue("@fechafin", fechaPago4.Value); 
            }
            else
            {
                command.Parameters.AddWithValue("@fechafin", DBNull.Value); 
            }

            // Ejecuta la consulta SQL.
            SqlDataReader reader = await command.ExecuteReaderAsync();
            // Lee los resultados y los agrega a las listas correspondientes.

            while (await reader.ReadAsync())
            {
                string nombreFamilia2 = reader.IsDBNull(0) ? "Sin código" : reader.GetString(0);
                NombreFamilia.Add(nombreFamilia2);

                decimal montoVendido = reader.IsDBNull(1) ? 0 : reader.GetDecimal(1);
                MontoFamilia.Add(montoVendido);
            }
        }

        return Page();
    }


    // Metodo que se encarga de mostrar los sectores de ventas basados en las fechas y tipo de movimiento proporcionados.

    public async Task<IActionResult> OnPostShowSectorVentas(DateOnly fechaPago4, string formatoFecha4, DateOnly? fechaPago5)
    {
        Console.WriteLine("Entre");
        //Estable la conexion
        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            await connection.OpenAsync();
            // Crea la consulta SQL para obtener los sectores de ventas segun los parametros

            SqlCommand command = new SqlCommand("SELECT * FROM dbo.VentaSector(@tipo, @fecha, @fechafin)", connection);

            // Asigna los valores de los parametros a la consulta.

            command.Parameters.AddWithValue("@tipo", formatoFecha4);  
            command.Parameters.AddWithValue("@fecha", fechaPago4.ToString("yyyy-MM-dd"));
            if (fechaPago5.HasValue)  
            {
                command.Parameters.AddWithValue("@fechafin", fechaPago5.Value); 
            }
            else
            {
                command.Parameters.AddWithValue("@fechafin", DBNull.Value); 
            }

            // Ejecuta la consulta y obtiene los resultados.
            SqlDataReader reader = await command.ExecuteReaderAsync();
            // Procesa los resultados de la consulta y los agrega a las listas correspondientes.

            while (await reader.ReadAsync())
            {
                string sector = reader.IsDBNull(0) ? "Sin sector" : reader.GetString(0);
                NombreSector.Add(sector);

                string descripcionSector = reader.IsDBNull(1) ? "Sin descripción" : reader.GetString(1);
                DescripcionSector.Add(descripcionSector);

                decimal monto = reader.IsDBNull(2) ? 0 : reader.GetDecimal(2);
                MontoSector.Add(monto);
            }
            // Muestra en consola los resultados obtenidos.

            Console.WriteLine("Sectores:");
            foreach (var nombre in NombreSector)
            {
                Console.WriteLine(nombre);
            }

            Console.WriteLine("Descripciones:");
            foreach (var descripcion in DescripcionSector)
            {
                Console.WriteLine(descripcion);
            }

            Console.WriteLine("Montos:");
            foreach (var monto in MontoSector)
            {
                Console.WriteLine(monto);
            }

        }

        return Page();
    }




    // Metodo para mostrar las zonas de ventas basadas en tipo de movimiento y fechas.

    public async Task<IActionResult> OnPostShowZonasVentas(DateOnly fechaPago5, string formatoFecha5, DateOnly? fechaPago6)
    {
        Console.WriteLine("Entre");

        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            await connection.OpenAsync();
            // Consulta para obtener las zonas de ventas.

            SqlCommand command = new SqlCommand("SELECT * FROM dbo.ventazona2(@tipo, @fecha, @fechafin)", connection);

            // Asigna los parametros a la consulta SQL.

            command.Parameters.AddWithValue("@tipo", formatoFecha5);
            command.Parameters.AddWithValue("@fecha", fechaPago5.ToString("yyyy-MM-dd"));
            if (fechaPago6.HasValue)
            {
                command.Parameters.AddWithValue("@fechafin", fechaPago6.Value);
            }
            else
            {
                command.Parameters.AddWithValue("@fechafin", DBNull.Value);
            }

            // Ejecuta la consulta SQL.
            SqlDataReader reader = await command.ExecuteReaderAsync();
            // Lee los resultados y agrega a las listas correspondientes.

            while (await reader.ReadAsync())
            {
                string zona = reader.IsDBNull(0) ? "Sin sector" : reader.GetString(0);
                NombreZona.Add(zona);

                string descripcionZona = reader.IsDBNull(1) ? "Sin descripción" : reader.GetString(1);
                DescripcionZona.Add(descripcionZona);

                decimal monto = reader.IsDBNull(2) ? 0 : reader.GetDecimal(2);
                MontoZona.Add(monto);
            }


        }

        return Page();
    }


    // Metodo que obtiene las ventas y cotizaciones por departamento dentro de un rango de fechas.

    public async Task<IActionResult> OnPostShowVentasCotizaciones(DateOnly fechaPago6, string formatoFecha6, DateOnly? fechaPago7)
    {
        Console.WriteLine("Entre");

        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            await connection.OpenAsync();
            // Consulta para obtener ventas por departamento.

            SqlCommand ventasCommand = new SqlCommand("SELECT departamento, montoventas FROM ventaspordepartamento(@tipo, @fecha, @fechafin)", connection);
            ventasCommand.Parameters.AddWithValue("@tipo", formatoFecha6);
            ventasCommand.Parameters.AddWithValue("@fecha", fechaPago6.ToString("yyyy-MM-dd"));
            if (fechaPago7.HasValue)
            {
                ventasCommand.Parameters.AddWithValue("@fechafin", fechaPago7.Value);
            }
            else
            {
                ventasCommand.Parameters.AddWithValue("@fechafin", DBNull.Value);
            }
            // Ejecuta la consulta y procesa los resultados de ventas.

            SqlDataReader ventasReader = await ventasCommand.ExecuteReaderAsync();

            var ventas = new Dictionary<string, decimal>();

            while (await ventasReader.ReadAsync())
            {
                string departamento = ventasReader.GetString(0);
                decimal montoVentas = ventasReader.GetDecimal(1);
                ventas[departamento] = montoVentas;  
            }
            ventasReader.Close();
            // Consulta para obtener cotizaciones por departamento.

            SqlCommand cotizacionesCommand = new SqlCommand("SELECT departamento, montocotizaciones FROM cotizacionespordepartamento(@tipo, @fecha, @fechafin)", connection);
            cotizacionesCommand.Parameters.AddWithValue("@tipo", formatoFecha6);
            cotizacionesCommand.Parameters.AddWithValue("@fecha", fechaPago6.ToString("yyyy-MM-dd"));
            if (fechaPago7.HasValue)
            {
                cotizacionesCommand.Parameters.AddWithValue("@fechafin", fechaPago7.Value);
            }
            else
            {
                cotizacionesCommand.Parameters.AddWithValue("@fechafin", DBNull.Value);
            }
            // Ejecuta la consulta y procesa los resultados de cotizaciones.

            SqlDataReader cotizacionesReader = await cotizacionesCommand.ExecuteReaderAsync();

            var cotizaciones = new Dictionary<string, decimal>();

            while (await cotizacionesReader.ReadAsync())
            {
                string departamento = cotizacionesReader.GetString(0);
                decimal montoCotizaciones = cotizacionesReader.GetDecimal(1);
                cotizaciones[departamento] = montoCotizaciones;  
            }
            cotizacionesReader.Close();
            // Combina los resultados de ventas y cotizaciones en una lista comparativa.

            var comparacion = new List<string>(); 
            var ventasMontos = new List<decimal>(); 
            var cotizacionesMontos = new List<decimal>(); 

            foreach (var departamento in ventas.Keys.Concat(cotizaciones.Keys).Distinct())
            {
                var montoVentas = ventas.ContainsKey(departamento) ? ventas[departamento] : 0;
                var montoCotizaciones = cotizaciones.ContainsKey(departamento) ? cotizaciones[departamento] : 0;

                comparacion.Add(departamento);
                ventasMontos.Add(montoVentas);
                cotizacionesMontos.Add(montoCotizaciones);
            }
            // Asigna los resultados a las propiedades para su uso en la vista.

            DeparmentosJuntos = comparacion.ToList();
            VentasDEP = ventasMontos.ToList();
            CotizacionesDEP = cotizacionesMontos.ToList();

            return Page();
        }
    }




    // Metodo que obtiene las ventas por departamento en un rango de fechas.

    public async Task<IActionResult> OnPostShowVentas(DateOnly fechaPago7, string formatoFecha7, DateOnly? fechaPago8)
    {
        Console.WriteLine("Entre");
        VentasDEP2 = new List<decimal>();
        DEPVENTAS2 = new List<string>();

        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            await connection.OpenAsync();
            // Consulta para obtener ventas por departamento.

            SqlCommand ventasCommand = new SqlCommand("SELECT * FROM dbo.ventaspordepartamento(@tipo, @fecha, @fechafin)", connection);
            ventasCommand.Parameters.AddWithValue("@tipo", formatoFecha7);
            ventasCommand.Parameters.AddWithValue("@fecha", fechaPago7.ToString("yyyy-MM-dd"));
            ventasCommand.Parameters.AddWithValue("@fechafin", fechaPago8.HasValue ? fechaPago8.Value : (object)DBNull.Value);
            // Ejecuta la consulta y procesa los resultados de ventas por departamento.

            SqlDataReader ventasReader = await ventasCommand.ExecuteReaderAsync();

            while (await ventasReader.ReadAsync())
            {
                string DEPVENTAS23 = ventasReader.GetString(0);  
                decimal VentasDEP23 = ventasReader.GetDecimal(1);  

                DEPVENTAS2.Add(DEPVENTAS23);
                VentasDEP2.Add(VentasDEP23);
            }

            ventasReader.Close();
        }

        return Page();
    }



    // Metodo que obtiene las ventas y cotizaciones combinadas para ser mostradas en la pagina.

    public async Task<IActionResult> OnPostShowVentasCotizacionesFactura()
    {
        Console.WriteLine("Entre");
        List<VentasCotizaciones> ventasCotizaciones = new List<VentasCotizaciones>();

        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            await connection.OpenAsync();
            // Ejecuta la consulta para obtener los datos combinados de ventas y cotizaciones.

            SqlCommand command = new SqlCommand("SELECT * FROM dbo.Combinado()", connection);

            SqlDataReader reader = await command.ExecuteReaderAsync();
            // Procesa los resultados y los agrega a una lista de objetos `VentasCotizaciones`.

            while (await reader.ReadAsync())
            {
                var ventaCotizacion = new VentasCotizaciones
                {
                    Mes = reader.GetInt32(reader.GetOrdinal("mes")),
                    Año = reader.GetInt32(reader.GetOrdinal("año")),
                    Total = reader.GetDecimal(reader.GetOrdinal("total")),
                    Tipo = reader.GetString(reader.GetOrdinal("tipo"))
                };

                ventasCotizaciones.Add(ventaCotizacion); 
            }

            reader.Close();
        }
        // Asigna la lista de `VentasCotizaciones` a `ViewData` para su uso en la vista.

        ViewData["VentasCotizaciones"] = ventasCotizaciones; 
        return Page(); 
    }




    public void OnPostShowTOPclientes(DateOnly? fechaPago17, string orden, string? formatoFecha17, DateOnly? fechaPago18 = null)
    {
        Console.WriteLine(fechaPago17);
        Console.WriteLine(orden);
        Console.WriteLine(formatoFecha17);
        Console.WriteLine(fechaPago18);
        string query;
        string tipo;
        // Determinar la consulta SQL basada en el orden ascendente o descendente

        if (orden == "Ascendente")
        {
            query = "SELECT * FROM dbo.top10ClientesAscendente(@tipo, @fecha, @fin)";
        }
        else
        {
            query = "SELECT * FROM dbo.top10ClientesDescendente(@tipo, @fecha, @fin)";
        }
        // Determinar el tipo de formato basado en la entrada

        tipo = string.IsNullOrEmpty(formatoFecha17) ? null : (formatoFecha17 == "mes(año)" ? "mes(año)" : "rangofecha");
        // Convertir las fechas recibidas a valores nulos si no estan presentes

        var fecha = fechaPago17.HasValue ? fechaPago17.Value : (DateOnly?)null;
        var fin = fechaPago18.HasValue ? fechaPago18.Value : (DateOnly?)null;
        // Crear una lista vacia para almacenar los clientes

        Clientes = new List<TopCliente>();
        // Abrir conexion a la base de datos y ejecutar la consulta SQL

        using (SqlConnection conn = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                // Agregar parametros a la consulta SQL

                cmd.Parameters.Add("@tipo", SqlDbType.NVarChar).Value = tipo ?? (object)DBNull.Value;
                cmd.Parameters.Add("@fecha", SqlDbType.Date).Value = fecha.HasValue ? fecha.Value.ToString("yyyy-MM-dd") : (object)DBNull.Value;
                cmd.Parameters.Add("@fin", SqlDbType.Date).Value = fin.HasValue ? fin.Value.ToString("yyyy-MM-dd") : (object)DBNull.Value;

                conn.Open(); // Abrir la conexion

                // Leer los resultados de la consulta y almacenarlos en la lista de clientes

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Clientes.Add(new TopCliente
                        {
                            Cliente = reader["cliente"].ToString(),
                            Monto = reader.IsDBNull(reader.GetOrdinal("monto")) ? 0 : reader.GetDecimal(reader.GetOrdinal("monto")),
                            FechaFactura = reader.IsDBNull(reader.GetOrdinal("FechaFactura")) ? DateTime.MinValue : reader.GetDateTime(reader.GetOrdinal("FechaFactura"))
                        });
                    }
                }
            }
        }
        Console.WriteLine("Información de los clientes:");
        foreach (var cliente in Clientes)
        {
            Console.WriteLine($"Cliente: {cliente.Cliente}");
            Console.WriteLine($"Monto: {cliente.Monto}");
            Console.WriteLine($"Fecha de Factura: {cliente.FechaFactura:yyyy-MM-dd}");
        }

        Console.WriteLine("Termine");
    }



    public void OnPostShowClientesZona(DateOnly? fechaPago27, string orden2, string? formatoFecha27, DateOnly? fechaPago28 = null)
    {
        // Imprimir los parametros recibidos para depuracion

        Console.WriteLine(fechaPago27);
        Console.WriteLine(orden2);
        Console.WriteLine(formatoFecha27);
        Console.WriteLine(fechaPago28);
        string query;
        string tipo;
        // Determinar la consulta SQL basada en el orden ascendente o descendente

        if (orden2 == "Ascendente")
        {
            query = "SELECT * FROM dbo.verClientesZonasAscendente(@tipo, @fecha, @fin)";
        }
        else
        {
            query = "SELECT * FROM dbo.verClientesZonasDescendente(@tipo, @fecha, @fin)";
        }
        // Determinar el tipo de formato basado en la entrada

        tipo = string.IsNullOrEmpty(formatoFecha27) ? null : (formatoFecha27 == "mes(año)" ? "mes(año)" : "rangofecha");
        // Convertir las fechas recibidas a valores nulos si no estan presentes

        var fecha = fechaPago27.HasValue ? fechaPago27.Value : (DateOnly?)null;
        var fin = fechaPago28.HasValue ? fechaPago28.Value : (DateOnly?)null;
        // Crear una lista vacia para almacenar las zonas

        Zona = new List<ZonaModel>();
        // Abrir conexion a la base de datos y ejecutar la consulta SQL

        using (SqlConnection conn = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                // Agregar parámetros
                cmd.Parameters.Add("@tipo", SqlDbType.NVarChar).Value = tipo ?? (object)DBNull.Value;
                cmd.Parameters.Add("@fecha", SqlDbType.Date).Value = fecha.HasValue ? fecha.Value.ToString("yyyy-MM-dd") : (object)DBNull.Value;
                cmd.Parameters.Add("@fin", SqlDbType.Date).Value = fin.HasValue ? fin.Value.ToString("yyyy-MM-dd") : (object)DBNull.Value;

                conn.Open();
                // Leer los resultados de la consulta y almacenarlos en la lista de zonas

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Zona.Add(new ZonaModel
                        {
                            Zona = reader["Zona"].ToString(),
                            ClientesZona = reader.IsDBNull(reader.GetOrdinal("ClientesZona")) ? 0 : reader.GetInt32(reader.GetOrdinal("ClientesZona")),
                            TotalVenta = reader.IsDBNull(reader.GetOrdinal("TotalVenta")) ? 0 : reader.GetDecimal(reader.GetOrdinal("TotalVenta"))
                        });
                    }
                }
            }
        }

        ViewData["Zonas"] = Zona;

        Console.WriteLine("Información de las zonas:");
        foreach (var zona in Zona)
        {
            Console.WriteLine($"Zona: {zona.Zona}");
            Console.WriteLine($"Clientes en la Zona: {zona.ClientesZona}");
            Console.WriteLine($"Total Venta: {zona.TotalVenta:C}");
        }

        Console.WriteLine("Terminé");
    }





    public void OnPostShowTareas(DateOnly? fechaPago37, string orden3, string? formatoFecha37, DateOnly? fechaPago38 = null)
    {
        Console.WriteLine(fechaPago37);
        Console.WriteLine(orden3);
        Console.WriteLine(formatoFecha37);
        Console.WriteLine(fechaPago38);

        string query;
        string tipo;
        // Determinar la consulta SQL basada en el orden ascendente o descendente

        if (orden3 == "Ascendente")
        {
            query = "SELECT * FROM dbo.verTareasAsc(@tipo, @fecha, @fin)";
        }
        else
        {
            query = "SELECT * FROM dbo.verTareasDesc(@tipo, @fecha, @fin)";
        }
        // Determinar el tipo de formato basado en la entrada

        tipo = string.IsNullOrEmpty(formatoFecha37) ? null : (formatoFecha37 == "mes(año)" ? "mes(año)" : "rangofecha");


        // Convertir las fechas recibidas a valores nulos si no estan presentes

        var fecha = fechaPago37.HasValue ? fechaPago37.Value : (DateOnly?)null;
        var fin = fechaPago38.HasValue ? fechaPago38.Value : (DateOnly?)null;
        // Crear una lista vacia para almacenar las tareas

        List<TareaModel> Tareas = new List<TareaModel>();
        // Abrir conexion a la base de datos y ejecutar la consulta SQL

        using (SqlConnection conn = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                // Agregar parámetros
                cmd.Parameters.Add("@tipo", SqlDbType.NVarChar).Value = tipo ?? (object)DBNull.Value;
                cmd.Parameters.Add("@fecha", SqlDbType.Date).Value = fecha.HasValue ? fecha.Value.ToString("yyyy-MM-dd") : (object)DBNull.Value;
                cmd.Parameters.Add("@fin", SqlDbType.Date).Value = fin.HasValue ? fin.Value.ToString("yyyy-MM-dd") : (object)DBNull.Value;

                conn.Open();
                // Leer los resultados de la consulta y almacenarlos en la lista de tareas

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Tareas2.Add(new TareaModel2
                        {
                            CodigoTarea = reader["CodigoTarea"].ToString(),
                            Fecha = reader.IsDBNull(reader.GetOrdinal("Fecha")) ? default : reader.GetDateTime(reader.GetOrdinal("Fecha")),
                            Descripcion2 = reader["Descripcion"].ToString(),
                            Estado2 = reader["Estado"].ToString()
                        });
                    }
                }
            }
        }
        // Almacenar la lista de tareas en ViewData para mostrar en la vista

        ViewData["Tareas"] = Tareas2;

        Console.WriteLine("Información de las tareas:");
        foreach (var tarea in Tareas2)
        {
            Console.WriteLine($"Código de Tarea: {tarea.CodigoTarea}");
            Console.WriteLine($"Fecha: {tarea.Fecha:yyyy-MM-dd}");
            Console.WriteLine($"Descripción: {tarea.Descripcion2}");
            Console.WriteLine($"Estado: {tarea.Estado2}");
        }

        Console.WriteLine("Terminé");
    }





    public void OnPostShowTopBodegas(string orden6)
    {
        // Imprimir parámetros iniciales
        Console.WriteLine($"Orden: {orden6}");

        // Definir la consulta SQL basada en el parametro 'orden6' para ordenar los resultados por 'TotalTransados'
        string query;
        // Si la orden es "Ascendente", ordenamos los resultados en orden ascendente por 'TotalTransados'

        if (orden6 == "Ascendente")
        {
            query = "SELECT * FROM transadosTotalesNOF ORDER BY TotalTransados ASC";
        }
        // Si la orden es diferente, ordenamos los resultados en orden descendente por 'TotalTransados'

        else
        {
            query = "SELECT * FROM transadosTotalesNOF ORDER BY TotalTransados DESC";
        }


        // Crear una lista vacia para almacenar los resultados de las bodegas
        List<Bodegas> bodegasList = new List<Bodegas>();

        try
        {
            // Establecer la conexion con la base de datos usando la cadena de conexion configurada

            using (SqlConnection conn = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                // Crear un comando SQL utilizando la consulta definida

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    // Ejecutar el comando y leer los resultados usando un SqlDataReader

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Recorrer los resultados obtenidos de la base de datos

                        while (reader.Read())
                        {
                            // Obtener el valor de la columna 'TotalTransados' y verificar que sea mayor a 0

                            var totalTransados = reader.GetInt32(reader.GetOrdinal("TotalTransados"));

                            if (totalTransados > 0)
                            {
                                // Si el total de transacciones es mayor que 0, agregar la bodega a la lista
                                bodegasList.Add(new Bodegas
                                {
                                    bodegas = reader["Bodega"].ToString(),
                                    TotalTransados = totalTransados
                                });
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error en la consulta: {ex.Message}");
        }

        // Almacenar resultados en ViewData
        ViewData["Bodegas"] = bodegasList;

        // Imprimir información final de las bodegas
        Console.WriteLine("Información de las bodegas:");
        foreach (var bodega in bodegasList)
        {
            Console.WriteLine($"Bodega: {bodega.bodegas}");
            Console.WriteLine($"Total Transados: {bodega.TotalTransados}");
        }

        Console.WriteLine("Terminé");
    }




    public class TopCliente
    {
        public string Cliente { get; set; }
        public decimal Monto { get; set; }
        public DateTime FechaFactura { get; set; }
    }
}

public class Bodegas
{
    public string bodegas { get; set; }
    public int TotalTransados { get; set; }

}


public class TareaModel
{
    public string CodigoTareaPer { get; set; }
    public string TipoTareaCotizacion { get; set; }
    public string TipoTareaCaso { get; set; }
    public DateTime? Fecha { get; set; }
    public string Descripcion { get; set; }
    public string Estado { get; set; }
}


public class TareaModel2
{
    public string CodigoTarea { get; set; }
    public DateTime Fecha { get; set; }
    public string Descripcion2 { get; set; }
    public string Estado2 { get; set; }
}

public class ZonaModel
{
    public string Zona { get; set; } 
    public int ClientesZona { get; set; } 
    public decimal TotalVenta { get; set; }  
}




public class VentasCotizaciones
{
    public int Mes { get; set; }
    public int Año { get; set; }
    public decimal Total { get; set; }
    public string Tipo { get; set; }
}
