namespace ChickenGang_Project.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Linq;

    [Table("DonDatHang")]
    public partial class DonDatHang
    {

        dbChickenGang db = new dbChickenGang();

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DonDatHang()
        {
            ChiTietDonDat = new HashSet<ChiTietDonDat>();
        }

        [Key]
        [DisplayName("Mã đơn hàng")]
        public int MaDDH { get; set; }

        [DisplayName("Ngày đặt hàng")]
        public DateTime? NgayDat { get; set; }

        public bool? TinhTrangGiaoHang { get; set; }

        [DisplayName("Ngày giao")]
        public DateTime? NgayGiao { get; set; }

        public bool? DaThanhToan { get; set; }

        public int? MaKH { get; set; }

        public int? UuDai { get; set; }

        [DisplayName("Địa chỉ giao hàng")]
        public string DiaChiGiaoHang { get; set; }

        [StringLength(11)]
        public string Sdt { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonDat> ChiTietDonDat { get; set; }

        public virtual KhachHang KhachHang { get; set; }

        public static implicit operator DonDatHang(string v)
        {
            throw new NotImplementedException();
        }

        public string GetTenKh(DonDatHang ct)
        {
            var user = db.DonDatHangs.SingleOrDefault(x => x.MaDDH == ct.MaDDH);
            if (user == null)
            {
                return null;
            }
            else
            {
                return ct.KhachHang.TenKH;

            }
        }

        public string GetEmail(DonDatHang ct)
        {
            var user = db.DonDatHangs.SingleOrDefault(x => x.MaDDH == ct.MaDDH);
            if (user == null)
            {

                return null;
            }
            else
            {
                return ct.KhachHang.Email;

            }
        }

       

    }
}
