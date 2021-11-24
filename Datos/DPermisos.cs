﻿using System;
using System.Data;
using System.Data.SqlClient;
using Sistema_de_asistencias.Logica;
using System.Windows.Forms;

namespace Sistema_de_asistencias.Datos
{
    public class DPermisos
    {
        public bool InsertarPermisos(LPermisos parametros)
        {
            // Protección del código. Evita que se detenga la aplicación en caso de algún fallo
            try
            {
                // Se abre la conexión al servidor.
                CONEXIONMAESTRA.Abrir();
                // SqlCommand REPRESENTA UN PROCEDIMIENTO ALMACENADO O UNA INSTRUCCIÓN DE Transact-SQL QUE SE EJECUTA EN UNA BD DE SQL SERVER. SE USA CUANDO SE MODIFICARÁ LA INFORMACIÓN EN UNA BD: Insertará, Eliminará, Editará
                // Procedimiento almacenado en la BD al que se hará referencia; se le indica la conexión a la base de datos
                SqlCommand cmd = new SqlCommand("InsertarPermisos", CONEXIONMAESTRA.conectar)
                {
                    // Le indicamos que el procedimiento requiere de parámetros para funcionar
                    CommandType = CommandType.StoredProcedure
                };
                // Pasamos todos los parámetros que requiere el procedimiento almacenado
                cmd.Parameters.AddWithValue("@IdModulo", parametros.IdModulo);
                cmd.Parameters.AddWithValue("@IdUsuario", parametros.IdUsuario);
                // ExecuteNonQuery ES UN MÉTODO QUE EJECUTA UNA INSTRUCCIÓN Transact-SQL EN LA CONEXIÓN Y DEVUELVE EL NÚMERO DE FILAS AFECTADAS
                // Ejecuta el procedimiento almacenado. Aquí se agrega la información en la BD
                cmd.ExecuteNonQuery();
                // Indica que todo ha salido correctamente al insertar la información en la BD
                return true;
            }
            // Si hubo algún fallo al manipular la BD...
            catch (Exception ex)
            {
                // ... muestra un mensaje de error. OBLIGATORIO usar Message si en SQL Server utilizamos Raiserror
                MessageBox.Show(ex.Message);
                // No inserta los datos en la BD
                return false;
            }
            // UN BLOQUE finally SIEMPRE SE EJECUTA, INDEPENDIENTEMENTE DE SI UNA EXCEPCIÓN FUE LANZADA O CAPTURADA
            finally
            {
                // Si está abierta la conexión a la BD y se ejecute o no el procedimiento: ciérrala
                CONEXIONMAESTRA.Cerrar();
            }
        }
        // Implementa el procedimiento almacenado que Muestra el Personal 
        public void MostrarPermisos(ref DataTable dt, LPermisos parametros)
        {
            // Protección del código. Evita que se detenga la aplicación en caso de algún fallo
            try
            {
                // Se abre la conexión al servidor
                CONEXIONMAESTRA.Abrir();
                // SqlDataAdapter REPRESENTA UN CONJUNTO DE COMANDOS DE DATOS Y UNA CONEXIÓN A UNA BD QUE SE USAN PARA RELLENAR DataSet Y ACTUALIZAR UNA BD DE SQL Server. EN SU MAYORÍA SE UTILIZA CUANDO QUEREMOS MOSTRAR INFORMACIÓN DE UNA BD
                // Clase utilizada para mostrar (adaptar) información de una base de datos. Pasamos el procedimiento almacenado al que hará referencia y la conexión a la BD
                SqlDataAdapter da = new SqlDataAdapter("MostrarPermisos", CONEXIONMAESTRA.conectar);
                // Indicamos que el procedimiento requiere de parámetros
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                // Pasamos los parámetros
                da.SelectCommand.Parameters.AddWithValue("@IdUsuario", parametros.IdUsuario);
                // Pasamos los datos obtenidos por la consulta a una tabla (DataTable) que posteriormente se mostrará en un DataGridView
                da.Fill(dt);
                // Si está abierta la conexión a la BD y se ejecutó o no el procedimiento: ciérrala
                CONEXIONMAESTRA.Cerrar();
            }
            // Si hubo algún fallo al manipular la BD ...
            catch (Exception ex)
            {
                // ... muestra un mensaje de error. Como en SQL Server no tenemos un Raiserror, usamos un StackTrace
                MessageBox.Show(ex.StackTrace);
            }
        }
        // Implementa el procedimiento almacenado que Elimina Personal en la Tabla Personal de la BD
        public bool EliminarPermisos(LPersonal parametros)
        {
            // Protección del código. Evita que se detenga la aplicación en caso de algún fallo
            try
            {
                // Se abre la conexión al servidor.
                CONEXIONMAESTRA.Abrir();
                // SqlCommand REPRESENTA UN PROCEDIMIENTO ALMACENADO O UNA INSTRUCCIÓN DE Transact-SQL QUE SE EJECUTA EN UNA BD DE SQL SERVER. SE USA CUANDO SE MODIFICARÁ LA INFORMACIÓN EN UNA BD: Insertar, Eliminar, Editar
                // Procedimiento almacenado en la BD al que se hará referencia; se le indica la conexión a la base de datos
                SqlCommand cmd = new SqlCommand("EliminarPermisos", CONEXIONMAESTRA.conectar)
                {
                    // Le indicamos que el procedimiento requiere de parámetros para funcionar
                    CommandType = CommandType.StoredProcedure
                };
                // Pasamos todos los parámetros que requiere el procedimiento almacenado
                cmd.Parameters.AddWithValue("@id_personal", parametros.Id_personal);
                // ExecuteNonQuery ES UN MÉTODO QUE EJECUTA UNA INSTRUCCIÓN Transact-SQL EN LA CONEXIÓN Y DEVUELVE EL NÚMERO DE FILAS AFECTADAS
                // Ejecuta la manipulación en la BD eliminando el Personal según el id pasado
                cmd.ExecuteNonQuery();
                // Indica que todo ha salido correctamente al eliminar la información en la BD
                return true;
            }
            // Si hubo algún fallo al manipular la BD ...
            catch (Exception ex)
            {
                // ... muestra un mensaje de error. OBLIGATORIO usar Message si en SQL Server utilizamos Raiserror
                MessageBox.Show(ex.Message);
                // No modifica la información en la BD
                return false;
            }
            // UN BLOQUE finally SIEMPRE SE EJECUTA, INDEPENDIENTEMENTE DE SI UNA EXCEPCIÓN FUE LANZADA O CAPTURADA
            finally
            {
                // Si está abierta la conexión a la BD y se ejecuta o no el procedimiento: ciérrala
                CONEXIONMAESTRA.Cerrar();
            }
        }
    }
}