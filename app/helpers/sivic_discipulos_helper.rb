module SivicDiscipulosHelper

	def BuscaPessoas(id)

	#sivic_pessoas = SivicPessoa.where(:father_id => id) rescue nil
	sivic_dados = SivicDiscipulo.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id where sp.father_id =' + id.to_s + '')
	#debugger

		if sivic_dados

				html = '<ul>'

			sivic_dados.each do |sivic_pessoas|

			if @tipo_relatorio == '0'
				html += '<li>'
			else
				html += '<tr class="odd gradeA">'
			end

				if @tipo_relatorio == '0'
					html += '<a href="#">' + sivic_pessoas.sivic_pessoa.NOME_pessoa + '</a>'
				else
					html += '<td>' + sivic_pessoas.sivic_pessoa.NOME_pessoa + '</td>'
					html += '<td>' + (sivic_pessoas.DATA_Nascimento.blank? ? '' : sivic_pessoas.DATA_Nascimento.strftime("%d/%m/%Y"))  + '</td>'
					html += '<td>' + sivic_pessoas.NUMR_CPF.to_s + '</td>'
					html += '<td>' + (sivic_pessoas.DATA_Batismo.blank? ? '' : sivic_pessoas.DATA_Batismo.strftime("%d/%m/%Y"))  + '</td>'
					html += '<td>' + sivic_pessoas.sivic_pessoa.father.NOME_pessoa + '</td>'					

				end

				html +=BuscaPessoas(sivic_pessoas.sivic_pessoa.id)

			if @tipo_relatorio == '0'
				html += '</li>'
			else
				html += '</tr>'
			end
				

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
