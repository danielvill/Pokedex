//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Pokedex_definitivo.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Captura
    {
        public int n_pokedex { get; set; }
        public int en_id { get; set; }
        public System.DateTime fecha { get; set; }
    
        public virtual Entrenador Entrenador { get; set; }
        public virtual Pokemon Pokemon { get; set; }
    }
}