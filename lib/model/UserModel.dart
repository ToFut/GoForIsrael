import 'dart:io';

class UserModel{
  String company_name;
  String category;
  String country;
  String company_representative;
  String title;
  String company_description;
  String website;
  String employees;
  String phone;
  String photo_url;
  String company_logo_url;
  String one_pager_url;
  File avatar_file;
  File photo_file;
  File company_logo_file;
  File one_pager_file;
  String past_investments;
  String ticket_size;
  String stage;
  String raising;
  String email;
  String password;
  String avatar_path;
  String path_photo;
  String path_logo;
  String path_pager;

  int invest_in_usd;
  bool isInvestor;


  UserModel(this.company_name, this.category, this.country,
      this.company_representative, this.title, this.company_description,
      this.website, this.employees, this.phone, this.photo_url,
      this.company_logo_url, this.one_pager_url, this.photo_file,
      this.company_logo_file, this.one_pager_file, this.past_investments,
      this.ticket_size, this.stage, this.raising, this.path_photo,
      this.avatar_path, this.path_logo, this.path_pager, this.invest_in_usd,
      this.isInvestor, this.email, this.password, this.avatar_file);

  UserModel.empty() {
    this.company_name = "";
    this.category = "";
    this.country = "";
    this.company_representative = "";
    this.title = "";
    this.company_description = "";
    this.website = "";
    this.employees = "";
    this.phone = "";
    this.photo_url = "";
    this.photo_file = null;
    this.company_logo_url = "";
    this.company_logo_file = null;
    this.one_pager_url = "";
    this.one_pager_file = null;
    this.past_investments = "";
    this.ticket_size = "";
    this.stage = "";
    this.raising = "";
    this.invest_in_usd = 0;
    this.isInvestor = true;
    this.avatar_path = "";
    this.path_logo = "";
    this.path_pager = "";
    this.path_photo = "";
    this.email = "";
    this.password = "";
    this.avatar_file = null;
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : company_name = json['company_name'],
        category = json['category'],
        country = json['country'],
        company_representative = json['company_representative'],
        title = json['title'],
        company_description = json['company_description'],
        website = json['website'],
        employees = json['employees'],
        phone = json['phone'],
        photo_url = json['photo'],
        company_logo_url = json['company_logo'],
        one_pager_url = json['one_pager'],
        past_investments = json['past_investments'],
        ticket_size = json['ticket_size'],
        stage = json['stage'],
        raising = json['raising'],
        avatar_path = json['avatar_path'],
        path_pager = json['path_pager'],
        path_logo = json['path_logo'],
        path_photo = json['path_photo'],
        invest_in_usd = json['invest_in_usd'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    return {
      'company_name': company_name,
      'category': category,
      'country': country,
      'company_representative' : company_representative,
      'title': title,
      'company_description' : company_description,
      'website': website,
      'employees': employees,
      'phone': phone,
      'past_investments': past_investments,
      'ticket_size': ticket_size,
      'stage': stage,
      'raising': raising,
      'invest_in_usd': invest_in_usd,
      'path_photo' : path_photo,
      'path_pager' : path_pager,
      'path_logo' : path_logo,
      'avatar_path' : avatar_path,
      'email' : email,
      'password' : password
    };
  }
}
