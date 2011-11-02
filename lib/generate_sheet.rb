require 'iconv'
require 'rubygems'
require 'spreadsheet'


class GenerateSheet

  def self.report1
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open ::Rails.root.to_s + '/public/excel/Reporte1_machote.xls'
    sheet = book.worksheet 0

    i = 12
    User.all.each do |usuario|
      sheet[i,0] = usuario.full_name
      if usuario.rol_id == 1
        sheet[i,1] = "Administrador"
      else
        sheet[i,1] = "Becario"
      end
      sheet[i,2] = usuario.phone
      sheet[i,3] = usuario.email
      sheet[i,4] = usuario.login_count
      sheet[i,5] = usuario.last_login_at
      sheet[i,6] = usuario.last_request_at
      sheet[i,7] = UserInstitution.find_all_by_user_id(usuario.id).size
      i = i + 1
    end


    book.write ::Rails.root.to_s + '/public/excel/reporte1.xls'
  end

  def self.report2
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open ::Rails.root.to_s + '/public/excel/Reporte2_machote.xls'
    sheet = book.worksheet 0

    i = 12
    Institution.find(:all, :order => 'name').each do |institucion|
      if UserInstitution.find_last_by_institution_id(institucion.id).nil?
        sheet[i,0] = institucion.name
        sheet[i,1] = institucion.address
        sheet[i,2] = institucion.phones
        i = i + 1
      end
    end

    book.write ::Rails.root.to_s + '/public/excel/instituciones_sin_registro.xls'
  end

    def self.report3
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open ::Rails.root.to_s + '/public/excel/Reporte3_machote.xls'
    sheet = book.worksheet 0

    i = 12
      UserInstitution.all.each do |solicitud|
        @total_registros_institucion = UserInstitution.find_all_by_institution_id(solicitud.institution_id)

        sheet[i,0] = solicitud.institution.name
        @total_registros_institucion.each do |registro|
          sheet[i,1] = registro.user.full_name
          sheet[i,2] = registro.visit_date
          sheet[i,3] = registro.hour_visit
          i = i + 1
        end
      end

    book.write ::Rails.root.to_s + '/public/excel/instituciones_con_solicitud.xls'
    end

    def self.report4
    Spreadsheet.client_encoding = 'UTF-8'
      book = Spreadsheet.open ::Rails.root.to_s + '/public/excel/Reporte4_machote.xls'
    sheet = book.worksheet 0

    i = 12
      UserInstitution.find_all_by_status(2).each do |solicitud|
        @total_registros_institucion = UserInstitution.find_all_by_institution_id(solicitud.institution_id)

        sheet[i,0] = solicitud.institution.name
        @total_registros_institucion.each do |registro|
          sheet[i,1] = registro.user.full_name
          sheet[i,2] = registro.desc
          i = i + 1
        end
      end

    book.write ::Rails.root.to_s + '/public/excel/instituciones_visitadas.xls'
    end
  end
