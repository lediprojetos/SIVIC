module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "SIVIC - Sistema de Visao Celular"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def buscaFilhos(id)

  	@pessoa = SivicPessoa.all

  	#debugger
	    @pessoa.each do |sivic_pessoas|
	      sivic_pessoas.NOME_pessoa
	    end

	  
  end

end