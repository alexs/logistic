# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def opciones(form,field,value)
    case value
    when 1
      f.radio_button(field,value)
    end
  end

  def get_boolean(value)
    if value.true?
      "Si"
    elsif value.false?
      "No"
    else
      ""
    end
  end


  def link_to_add_fields(name,f,association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
end



