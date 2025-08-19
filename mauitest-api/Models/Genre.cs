using System.ComponentModel.DataAnnotations.Schema;

namespace MauitestApi.Models;

[Table("genres")]
public class Genre
{
    [Column("id")]
    public int Id { get; set; }

    [Column("name")]
    public string Name { get; set; }
}