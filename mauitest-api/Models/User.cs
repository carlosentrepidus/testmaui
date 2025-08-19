using System.ComponentModel.DataAnnotations.Schema;

namespace MauitestApi.Models;

[Table("users")]
public class User
{
    [Column("id")]
    public int Id { get; set; }

    [Column("username")]
    public string Username { get; set; }
}