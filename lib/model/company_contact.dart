

class CompanyContact {
  String phoneNumber;
  String email;
  String address;

  CompanyContact(
    {
      required this.phoneNumber,
      required this.email,
      required this.address,
    }
  );

  static CompanyContact item = CompanyContact(
    phoneNumber: "+902163300300",
    email: "info@demirli.com.tr",
    address: "Yıldızbakkal Taşköprü Cad. Demirli İş Merkezi Kadıköy - İSTANBUL"
  );
}