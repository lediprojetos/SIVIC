module SivicDiscipulosHelper

	def BuscaPessoas(id)

	sivic_dados = SivicDiscipulo.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id where sp.father_id =' + id.to_s + '')

		if sivic_dados

			html = '<ul>'

			sivic_dados.each do |sivic_pessoas|

			html += '<li>'
			
			html += '<a href="#">' + sivic_pessoas.sivic_pessoa.NOME_pessoa + '</a>'

			html +=BuscaPessoas(sivic_pessoas.sivic_pessoa.id)

			html += '</li>'

			end

			html += '</ul>'
		end
			
		html = html.gsub('<ul></ul>', '')

		html.html_safe

	end


def BuscaPessoas2(id)

	sivic_dados = SivicDiscipulo.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id where sp.father_id =' + id.to_s + '')

		if sivic_dados

				html = '<ul>'

			sivic_dados.each do |sivic_pessoas|

				html += '<tr class="odd gradeA">'

					html += '<td>' + sivic_pessoas.sivic_pessoa.NOME_pessoa + '</td>'
					html += '<td>' + (sivic_pessoas.DATA_Nascimento.blank? ? '' : sivic_pessoas.DATA_Nascimento.strftime("%d/%m/%Y"))  + '</td>'
					html += '<td>' + sivic_pessoas.NUMR_CPF.to_s + '</td>'
					html += '<td>' + (sivic_pessoas.DATA_Batismo.blank? ? '' : sivic_pessoas.DATA_Batismo.strftime("%d/%m/%Y"))  + '</td>'
					html += '<td>' + sivic_pessoas.sivic_pessoa.father.NOME_pessoa + '</td>'					

				html +=BuscaPessoas2(sivic_pessoas.sivic_pessoa.id)
			
				html += '</tr>'

			end

			html += '</ul>'
		end
		
			html = html.gsub('<ul></ul>', '')
			html = html.gsub('<ul>', '')
			html = html.gsub('</ul>', '')
			html.html_safe
	end	

end
