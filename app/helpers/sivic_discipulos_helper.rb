module SivicDiscipulosHelper

	def BuscaPessoas(id)


	sivic_pessoas = SivicPessoa.where(:father_id => id) rescue nil

		if sivic_pessoas

				html = '<ul>'

			sivic_pessoas.each do |sivic_pessoas|

			if @tipo_relatorio == '0'
				html += '<li>'
			else
				html += '<li class="list-group-item">'
			end

				html += '<a href="#">' + sivic_pessoas.NOME_pessoa + '</a>'

				html +=BuscaPessoas(sivic_pessoas.id)

			html += '</li>'

			end

			html += '</ul>'
		end

		#debugger
		if @tipo_relatorio == '0'
			html = html.gsub('<ul></ul>', '')
		else
			html = html.gsub('<ul></ul>', '')
			html = html.gsub('<ul>', '')
			html = html.gsub('</ul>', '')
		end
		html.html_safe
	end

end
