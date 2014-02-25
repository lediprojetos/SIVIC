module SivicDiscipulosHelper

	def BuscaPessoas(id)


	sivic_pessoas = SivicPessoa.where(:father_id => id) rescue nil

		if sivic_pessoas

			html = '<ul>'

			sivic_pessoas.each do |sivic_pessoas|

			html += '<li>'

				html += '<a href="#">' + sivic_pessoas.NOME_pessoa + '</a>'

				html +=BuscaPessoas(sivic_pessoas.id)

			html += '</li>'

			end

			html += '</ul>'
		end

		#debugger
		html = html.gsub('<ul></ul>', '')
		html.html_safe
	end

end
