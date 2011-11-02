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



    def self.report3
      Spreadsheet.client_encoding = 'UTF-8'
      book = Spreadsheet.open ::Rails.root.to_s + '/public/excel/Reporte3.xls'
      sheet = book.worksheet 0
      i = 13
     Elementary.find(:all,:order => 'nombre').each do |escuelas|
        sheet[i,0] = escuelas.id.to_s
        sheet[i,2] = Evaluation.find_all_by_elementary_id_and_gr_nutrition(escuelas.id,1).size
        sheet[i,3] = Evaluation.find_all_by_elementary_id_and_gr_nutrition(escuelas.id,2).size
        sheet[i,4] = Evaluation.find_all_by_elementary_id_and_gr_nutrition(escuelas.id,3).size
        sheet[i,5] = Evaluation.find_all_by_elementary_id_and_gr_nutrition(escuelas.id,4).size
        sheet[i,6] = Evaluation.find_all_by_elementary_id_and_gr_nutrition(escuelas.id,5).size
    #    sheet[i,7] = Evaluation.find_all_by_elementary_id(escuelas.id).size
        i = i + 1
      end

      book.write ::Rails.root.to_s + '/public/excel/evaluacion3.xls'
    end



    def self.report4
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open ::Rails.root.to_s + '/public/excel/Reporte4.xls'
    sheet = book.worksheet 0
    
      sheet[13,1] = Evaluation.find_all_by_grado_and_gr_nutrition(1,1).size
      sheet[13,2] = Evaluation.find_all_by_grado_and_gr_nutrition(1,2).size
      sheet[13,3] = Evaluation.find_all_by_grado_and_gr_nutrition(1,3).size
      sheet[13,4] = Evaluation.find_all_by_grado_and_gr_nutrition(1,4).size
      sheet[13,5] = Evaluation.find_all_by_grado_and_gr_nutrition(1,5).size
      sheet[13,6] = Evaluation.find_all_by_grado(1).size

      sheet[14,1] = Evaluation.find_all_by_grado_and_gr_nutrition(2,1).size
      sheet[14,2] = Evaluation.find_all_by_grado_and_gr_nutrition(2,2).size
      sheet[14,3] = Evaluation.find_all_by_grado_and_gr_nutrition(2,3).size
      sheet[14,4] = Evaluation.find_all_by_grado_and_gr_nutrition(2,4).size
      sheet[14,5] = Evaluation.find_all_by_grado_and_gr_nutrition(2,5).size
      sheet[14,6] = Evaluation.find_all_by_grado(2).size

      sheet[15,1] = Evaluation.find_all_by_grado_and_gr_nutrition(3,1).size
      sheet[15,2] = Evaluation.find_all_by_grado_and_gr_nutrition(3,2).size
      sheet[15,3] = Evaluation.find_all_by_grado_and_gr_nutrition(3,3).size
      sheet[15,4] = Evaluation.find_all_by_grado_and_gr_nutrition(3,4).size
      sheet[15,5] = Evaluation.find_all_by_grado_and_gr_nutrition(3,5).size
      sheet[15,6] = Evaluation.find_all_by_grado(3).size

      sheet[16,1] = Evaluation.find_all_by_grado_and_gr_nutrition(4,1).size
      sheet[16,2] = Evaluation.find_all_by_grado_and_gr_nutrition(4,2).size
      sheet[16,3] = Evaluation.find_all_by_grado_and_gr_nutrition(4,3).size
      sheet[16,4] = Evaluation.find_all_by_grado_and_gr_nutrition(4,4).size
      sheet[16,5] = Evaluation.find_all_by_grado_and_gr_nutrition(4,5).size
      sheet[16,6] = Evaluation.find_all_by_grado(4).size 

      sheet[17,1] = Evaluation.find_all_by_grado_and_gr_nutrition(5,1).size
      sheet[17,2] = Evaluation.find_all_by_grado_and_gr_nutrition(5,2).size
      sheet[17,3] = Evaluation.find_all_by_grado_and_gr_nutrition(5,3).size
      sheet[17,4] = Evaluation.find_all_by_grado_and_gr_nutrition(5,4).size
      sheet[17,5] = Evaluation.find_all_by_grado_and_gr_nutrition(5,5).size
      sheet[17,6] = Evaluation.find_all_by_grado(5).size     

      sheet[18,1] = Evaluation.find_all_by_grado_and_gr_nutrition(6,1).size
      sheet[18,2] = Evaluation.find_all_by_grado_and_gr_nutrition(6,2).size
      sheet[18,3] = Evaluation.find_all_by_grado_and_gr_nutrition(6,3).size
      sheet[18,4] = Evaluation.find_all_by_grado_and_gr_nutrition(6,4).size
      sheet[18,5] = Evaluation.find_all_by_grado_and_gr_nutrition(6,5).size
      sheet[18,6] = Evaluation.find_all_by_grado(6).size     


      book.write ::Rails.root.to_s + '/public/excel/evaluacion4.xls'
    end





 def self.report5
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open ::Rails.root.to_s + '/public/excel/Reporte5.xls'
    sheet = book.worksheet 0


     cinco_1 = [ ]
    cinco_2 = [ ]
    cinco_3 = [ ]
    cinco_4 = [ ]
    cinco_5 = [ ]

    seis_1 = [ ]
    seis_2 = [ ]
    seis_3 = [ ]
    seis_4 = [ ]
    seis_5 = [ ]

    siete_1 = [ ]
    siete_2 = [ ]
    siete_3 = [ ]
    siete_4 = [ ]
    siete_5 = [ ]

    ocho_1 = [ ]
    ocho_2 = [ ]
    ocho_3 = [ ]
    ocho_4 = [ ]
    ocho_5 = [ ]

    nueve_1 = [ ]
    nueve_2 = [ ]
    nueve_3 = [ ]
    nueve_4 = [ ]
    nueve_5 = [ ]

    diez_1 = [ ]
    diez_2 = [ ]
    diez_3 = [ ]
    diez_4 = [ ]
    diez_5 = [ ]

    once_1 = [ ]
    once_2 = [ ]
    once_3 = [ ]
    once_4 = [ ]
    once_5 = [ ]


    doce_1 = [ ]
    doce_2 = [ ]
    doce_3 = [ ]
    doce_4 = [ ]
    doce_5 = [ ]


    trece_1 = [ ]
    trece_2 = [ ]
    trece_3 = [ ]
    trece_4 = [ ]
    trece_5 = [ ]


    catorce_1 = [ ]
    catorce_2 = [ ]
    catorce_3 = [ ]
    catorce_4 = [ ]
    catorce_5 = [ ]
    catorce_total = []


    Evaluation.all.each do |evaluacion|
    
     
      if evaluacion.age == 5 && evaluacion.gr_nutrition == 1
        cinco_1 << evaluacion.id
      elsif evaluacion.age == 5 && evaluacion.gr_nutrition == 2
        cinco_2 << evaluacion.id
      elsif evaluacion.age == 5 && evaluacion.gr_nutrition == 3
        cinco_3 << evaluacion.id
      elsif evaluacion.age == 5 && evaluacion.gr_nutrition == 4
        cinco_4 << evaluacion.id
        elsif evaluacion.age == 5 && evaluacion.gr_nutrition == 5
        cinco_5 << evaluacion.id
        end
    
     if evaluacion.age == 6 && evaluacion.gr_nutrition == 1
        seis_1 << evaluacion.id
      elsif evaluacion.age == 6 && evaluacion.gr_nutrition == 2
        seis_2 << evaluacion.id
      elsif evaluacion.age == 6 && evaluacion.gr_nutrition == 3
        seis_3 << evaluacion.id
      elsif evaluacion.age == 6 && evaluacion.gr_nutrition == 4
        seis_4 << evaluacion.id
        elsif evaluacion.age == 6 && evaluacion.gr_nutrition == 5
        seis_5 << evaluacion.id
        end


    if evaluacion.age == 7 && evaluacion.gr_nutrition == 1
        siete_1 << evaluacion.id
      elsif evaluacion.age == 7 && evaluacion.gr_nutrition == 2
        siete_2 << evaluacion.id
      elsif evaluacion.age == 7 && evaluacion.gr_nutrition == 3
        siete_3 << evaluacion.id
      elsif evaluacion.age == 7 && evaluacion.gr_nutrition == 4
        siete_4 << evaluacion.id
        elsif evaluacion.age == 7 && evaluacion.gr_nutrition == 5
        siete_5 << evaluacion.id
        end
    
     if evaluacion.age == 8 && evaluacion.gr_nutrition == 1
        ocho_1 << evaluacion.id
      elsif evaluacion.age == 8 && evaluacion.gr_nutrition == 2
        ocho_2 << evaluacion.id
      elsif evaluacion.age == 8 && evaluacion.gr_nutrition == 3
        ocho_3 << evaluacion.id
      elsif evaluacion.age == 8 && evaluacion.gr_nutrition == 4
        ocho_4 << evaluacion.id
        elsif evaluacion.age == 8 && evaluacion.gr_nutrition == 5
        ocho_5 << evaluacion.id
      end
    
if evaluacion.age == 9 && evaluacion.gr_nutrition == 1
        nueve_1 << evaluacion.id
      elsif evaluacion.age == 9 && evaluacion.gr_nutrition == 2
        nueve_2 << evaluacion.id
      elsif evaluacion.age == 9 && evaluacion.gr_nutrition == 3
        nueve_3 << evaluacion.id
      elsif evaluacion.age == 9 && evaluacion.gr_nutrition == 4
        nueve_4 << evaluacion.id
        elsif evaluacion.age == 9 && evaluacion.gr_nutrition == 5
        nueve_5 << evaluacion.id
      end
    
  if evaluacion.age == 10 && evaluacion.gr_nutrition == 1
          diez_1 << evaluacion.id
        elsif evaluacion.age == 10 && evaluacion.gr_nutrition == 2
          diez_2 << evaluacion.id
      elsif evaluacion.age == 10 && evaluacion.gr_nutrition == 3
        diez_3 << evaluacion.id
      elsif evaluacion.age == 10 && evaluacion.gr_nutrition == 4
        diez_4 << evaluacion.id
        elsif evaluacion.age == 10 && evaluacion.gr_nutrition == 5
        diez_5 << evaluacion.id
      end
    
if evaluacion.age == 11 && evaluacion.gr_nutrition == 1
        once_1 << evaluacion.id
      elsif evaluacion.age == 11 && evaluacion.gr_nutrition == 2
        once_2 << evaluacion.id
      elsif evaluacion.age == 11 && evaluacion.gr_nutrition == 3
        once_3 << evaluacion.id
      elsif evaluacion.age == 11 && evaluacion.gr_nutrition == 4
        once_4 << evaluacion.id
        elsif evaluacion.age == 11 && evaluacion.gr_nutrition == 5
        once_5 << evaluacion.id
      end
    
if evaluacion.age == 12 && evaluacion.gr_nutrition == 1
        doce_1 << evaluacion.id
      elsif evaluacion.age == 12 && evaluacion.gr_nutrition == 2
        doce_2 << evaluacion.id
      elsif evaluacion.age == 12 && evaluacion.gr_nutrition == 3
        doce_3 << evaluacion.id
      elsif evaluacion.age == 12 && evaluacion.gr_nutrition == 4
        doce_4 << evaluacion.id
        elsif evaluacion.age == 12 && evaluacion.gr_nutrition == 5
        doce_5 << evaluacion.id
      end
    
if evaluacion.age == 13 && evaluacion.gr_nutrition == 1
        trece_1 << evaluacion.id
      elsif evaluacion.age == 13 && evaluacion.gr_nutrition == 2
        trece_2 << evaluacion.id
      elsif evaluacion.age == 13 && evaluacion.gr_nutrition == 3
        trece_3 << evaluacion.id
      elsif evaluacion.age == 13 && evaluacion.gr_nutrition == 4
        trece_4 << evaluacion.id
        elsif evaluacion.age == 13 && evaluacion.gr_nutrition == 5
        trece_5 << evaluacion.id
      end
    
if evaluacion.age == 14 && evaluacion.gr_nutrition == 1
        catorce_1 << evaluacion.id
      elsif evaluacion.age == 14 && evaluacion.gr_nutrition == 2
        catorce_2 << evaluacion.id
      elsif evaluacion.age == 14 && evaluacion.gr_nutrition == 3
        catorce_3 << evaluacion.id
      elsif evaluacion.age == 14 && evaluacion.gr_nutrition == 4
        catorce_4 << evaluacion.id
        elsif evaluacion.age == 14 && evaluacion.gr_nutrition == 5
        catorce_5 << evaluacion.id
      end
        
    
    
    
    


      sheet[13,2] = cinco_1.size.to_i
      sheet[13,3] = cinco_2.size.to_i
      sheet[13,4] = cinco_3.size.to_i
      sheet[13,5] = cinco_4.size.to_i
      sheet[13,6] = cinco_5.size.to_i 
    
    
      sheet[14,2] = seis_1.size.to_i
      sheet[14,3] = seis_2.size.to_i
      sheet[14,4] = seis_3.size.to_i
      sheet[14,5] = seis_4.size.to_i
      sheet[14,6] = seis_5.size.to_i
    
      sheet[15,2] = siete_1.size.to_i
      sheet[15,3] = siete_2.size.to_i
      sheet[15,4] = siete_3.size.to_i
      sheet[15,5] = siete_4.size.to_i
      sheet[15,6] = siete_5.size.to_i
    
      sheet[16,2] = ocho_1.size.to_i
      sheet[16,3] = ocho_2.size.to_i
      sheet[16,4] = ocho_3.size.to_i
      sheet[16,5] = ocho_4.size.to_i
      sheet[16,6] = ocho_5.size.to_i
      
      sheet[17,2] = nueve_1.size.to_i
      sheet[17,3] = nueve_2.size.to_i
      sheet[17,4] = nueve_3.size.to_i
      sheet[17,5] = nueve_4.size.to_i
      sheet[17,6] = nueve_5.size.to_i
    
    
      sheet[18,2] = diez_1.size.to_i
      sheet[18,3] = diez_2.size.to_i
      sheet[18,4] = diez_3.size.to_i
      sheet[18,5] = diez_4.size.to_i
      sheet[18,6] = diez_5.size.to_i
    
      sheet[19,2] = once_1.size.to_i
      sheet[19,3] = once_2.size.to_i
      sheet[19,4] = once_3.size.to_i
      sheet[19,5] = once_4.size.to_i
      sheet[19,6] = once_5.size.to_i
    
      sheet[20,2] = doce_1.size.to_i
      sheet[20,3] = doce_2.size.to_i
      sheet[20,4] = doce_3.size.to_i
      sheet[20,5] = doce_4.size.to_i
      sheet[20,6] = doce_5.size.to_i
      
      sheet[21,2] = trece_1.size.to_i
      sheet[21,3] = trece_2.size.to_i
      sheet[21,4] = trece_3.size.to_i
      sheet[21,5] = trece_4.size.to_i
      sheet[21,6] = trece_5.size.to_i
      
      sheet[22,2] = catorce_1.size.to_i
      sheet[22,3] = catorce_2.size.to_i
      sheet[22,4] = catorce_3.size.to_i
      sheet[22,5] = catorce_4.size.to_i
      sheet[22,6] = catorce_5.size.to_i
      

    end

    book.write ::Rails.root.to_s + '/public/excel/evaluacion5.xls'
 end


    def self.report6
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open ::Rails.root.to_s + '/public/excel/Reporte6.xls'
    sheet = book.worksheet 0
   
    
      sheet[13,1] = Evaluation.find_all_by_sexo_and_gr_nutrition(1,1).size
      sheet[13,2] = Evaluation.find_all_by_sexo_and_gr_nutrition(1,2).size
      sheet[13,3] = Evaluation.find_all_by_sexo_and_gr_nutrition(1,3).size
      sheet[13,4] = Evaluation.find_all_by_sexo_and_gr_nutrition(1,4).size
      sheet[13,5] = Evaluation.find_all_by_sexo_and_gr_nutrition(1,5).size
      sheet[13,6] = Evaluation.find_all_by_sexo(1).size

      sheet[14,1] = Evaluation.find_all_by_sexo_and_gr_nutrition(2,1).size
      sheet[14,2] = Evaluation.find_all_by_sexo_and_gr_nutrition(2,2).size
      sheet[14,3] = Evaluation.find_all_by_sexo_and_gr_nutrition(2,3).size
      sheet[14,4] = Evaluation.find_all_by_sexo_and_gr_nutrition(2,4).size
      sheet[14,5] = Evaluation.find_all_by_sexo_and_gr_nutrition(2,5).size
      sheet[14,6] = Evaluation.find_all_by_sexo(2).size
        
      book.write ::Rails.root.to_s + '/public/excel/evaluacion6.xls'
  end

  def self.report7
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open ::Rails.root.to_s + '/public/excel/Reporte7.xls'
    sheet = book.worksheet 0
    sheet[14, 3]
    book.write ::Rails.root.to_s + '/public/excel/evaluacion7.xls'
  end

  def self.report8
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open ::Rails.root.to_s + '/public/excel/Reporte8.xls'
    sheet = book.worksheet 0
    sheet[14, 3]
    book.write ::Rails.root.to_s + '/public/excel/evaluacion8.xls'
  end

  def self.report9
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open ::Rails.root.to_s + '/public/excel/Reporte9.xls'
    sheet = book.worksheet 0
    sheet[14, 3]
    book.write ::Rails.root.to_s + '/public/excel/evaluacion9.xls'
  end

  end
