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




    public async Task<IActionResult> OnPostShowPagoPlanillasAsync(string fechaPago, string formatoFecha)
    {
        Console.WriteLine("Entre");
        MontoPagadoPorMes = new List<int>();
        Meses = new List<string>();
        Planillas = new List<string>();

        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            await connection.OpenAsync();

            DateTime fecha = DateTime.Parse(fechaPago);
            string fechaFin = null;

            if (formatoFecha == "RangoFecha")
            {
                
                fechaFin = fecha.AddMonths(1).ToString("yyyy-MM-dd"); 
            }

            SqlCommand command = new SqlCommand("SELECT montopagado, Planilla FROM dbo.pagosplanilla(@fecha, @tipo, @fechaPago2)", connection);
            command.Parameters.AddWithValue("@fecha", fechaPago);  
            command.Parameters.AddWithValue("@tipo", formatoFecha);  

            if (formatoFecha == "RangoFecha")
            {
                command.Parameters.AddWithValue("@fechaPago2", fechaFin); 
            }
            else
            {
                command.Parameters.AddWithValue("@fechaPago2", fechaPago); 
            }

            SqlDataReader reader = await command.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                string mesAnio = string.Empty;

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

                Meses.Add(mesAnio);

                MontoPagadoPorMes.Add(reader.IsDBNull(0) ? 0 : reader.GetInt32(0));

                Planillas.Add(reader.IsDBNull(1) ? "Sin Código" : reader.GetString(1));
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

        if (fechaPago2.HasValue)
        {
            fechaFinFormatted = fechaPago2.Value.ToString("yyyy-MM-dd");
        }

        Console.WriteLine($"fechaFinFormatted: {fechaFinFormatted ?? "null"}");

        Departamentos.Clear();
        MontoPagadoPorMesDEP.Clear();

        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            await connection.OpenAsync();

            SqlCommand command = new SqlCommand("SELECT * FROM pagosplanilladep(@mes, @tipo, @fechafin)", connection);

            command.Parameters.Add(new SqlParameter("@mes", SqlDbType.Date) { Value = fechaPago });
            command.Parameters.Add(new SqlParameter("@tipo", SqlDbType.VarChar) { Value = formatoFecha2 });
            command.Parameters.Add(new SqlParameter("@fechafin", SqlDbType.Date) { Value = (object)fechaFinFormatted ?? DBNull.Value });

            SqlDataReader reader = await command.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
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









    public async Task<IActionResult> OnPostShowVerTipoMovimientoAsync(string tipoMovimiento)
    {

        Console.WriteLine("Entre");
        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            await connection.OpenAsync();

            SqlCommand command = new SqlCommand("exec SalidaEntrada @tipo", connection);
            command.Parameters.AddWithValue("@tipo", tipoMovimiento);

            SqlDataReader reader = await command.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                string codigoBodega = reader.IsDBNull(0) ? "Sin código" : reader.GetString(0);
                BodegasMOV.Add(codigoBodega);

                int monto = reader.IsDBNull(1) ? 0 : reader.GetInt32(1);
                CantidadMOV.Add(monto);
            }
        }

        return Page();
    }






    public async Task<IActionResult> OnPostShowTopFamilias(DateOnly fechaPago3, string formatoFecha3, DateOnly? fechaPago4)
    {
        Console.WriteLine("Entre");


        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            await connection.OpenAsync();

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


            SqlDataReader reader = await command.ExecuteReaderAsync();

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



    public async Task<IActionResult> OnPostShowSectorVentas(DateOnly fechaPago4, string formatoFecha4, DateOnly? fechaPago5)
    {
        Console.WriteLine("Entre");

        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            await connection.OpenAsync();

            SqlCommand command = new SqlCommand("SELECT * FROM dbo.VentaSector(@tipo, @fecha, @fechafin)", connection);

          
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


            SqlDataReader reader = await command.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                string sector = reader.IsDBNull(0) ? "Sin sector" : reader.GetString(0);
                NombreSector.Add(sector);

                string descripcionSector = reader.IsDBNull(1) ? "Sin descripción" : reader.GetString(1);
                DescripcionSector.Add(descripcionSector);

                decimal monto = reader.IsDBNull(2) ? 0 : reader.GetDecimal(2);
                MontoSector.Add(monto);
            }
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





    public async Task<IActionResult> OnPostShowZonasVentas(DateOnly fechaPago5, string formatoFecha5, DateOnly? fechaPago6)
    {
        Console.WriteLine("Entre");

        using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            await connection.OpenAsync();

            SqlCommand command = new SqlCommand("SELECT * FROM dbo.VentaSector(@tipo, @fecha, @fechafin)", connection);


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


            SqlDataReader reader = await command.ExecuteReaderAsync();

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













    public class TareaModel
    {
        public string CodigoTareaPer { get; set; }
        public string TipoTareaCotizacion { get; set; }
        public string TipoTareaCaso { get; set; }
        public DateTime? Fecha { get; set; } 
        public string Descripcion { get; set; }
        public string Estado { get; set; }
    }

}