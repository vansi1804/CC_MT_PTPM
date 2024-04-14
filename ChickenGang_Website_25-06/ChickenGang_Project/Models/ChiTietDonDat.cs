namespace ChickenGang_Project.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Linq;

    [Table("ChiTietDonDat")]
    public partial class ChiTietDonDat
    {
        dbChickenGang db = new dbChickenGang();

        [Key]
        public int MaChiTietDonDat { get; set; }

        [DisplayName("Mã đơn")]
        public int? MaDDH { get; set; }

        public int? MaSP { get; set; }

        [StringLength(255)]
        [DisplayName("Tên sản phẩm")]
        public string TenSP { get; set; }

        [DisplayName("Số lượng")]
        public int? SoLuong { get; set; }

        [DisplayName("Đơn giá")]
        public decimal? DonGia { get; set; }

        public virtual DonDatHang DonDatHang { get; set; }

        public virtual SanPham SanPham { get; set; }

        
    }
}
