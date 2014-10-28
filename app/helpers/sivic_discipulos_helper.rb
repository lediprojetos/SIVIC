module SivicDiscipulosHelper

	def BuscaPessoas(id)

	sivic_dados = SivicDiscipulo.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id where sp.father_id = ' + id.to_s)

		if sivic_dados

			html = '<ul>'

			sivic_dados.each do |sivic_pessoas|

			html += '<li>'
			
			html += '<a href="#">' + sivic_pessoas.sivic_pessoa.nome_pessoa + '</a>'

			html +=BuscaPessoas(sivic_pessoas.sivic_pessoa.id)

			html += '</li>'

			end

			html += '</ul>'
		end
			
		html = html.gsub('<ul></ul>', '')

		html.html_safe

	end

end
