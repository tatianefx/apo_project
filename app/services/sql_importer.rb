class SqlImporter

	TABLES_MAP = {
		'apo' => Apo,
#		'apo_tecnica' => AposTechnical,
#		'atributo' => Attribute,
#		'categoria' => Category,
#		'comodo' => Room,
#		'conceito' => Concept,
#		'conceito_pergunta' => AnswersConcept,
#		'conceito_qualificador' => ConceptsQualifier,
#		'morador' => Resident,
#		'pergunta' => Question,
#		'pergunta_atributo' => AnswersAttribute,
#		'pergunta_categoria' => AnswersCategory,
#		'pergunta_comodo' => AnswersRoom,
#		'pergunta_qualificador' => AnswersQualifier,
#		'qualificador' => Qualifier,
#		'resposta' => Answer,
		'tecnica' => Technical,
#		'tecnica_categoria' => CategoriesTechnical
	}

	attr_reader :sql

	def initialize(sql)
		@sql = sql
	end

	def import
		sql_instructions = sql.split("\n")

		sql_instructions.each do |instruction|
			if instruction =~ /BEGIN.*/
				# ignore
			elsif instruction =~ /CREATE TABLE.*/
				# ignore
			elsif instruction =~ /INSERT INTO.*/
				table_name = instruction.match(/`(\w+)`/)[1]

				case table_name
				when 'tecnica'
					import_technical(instruction)
				when 'apo'
					import_apo(instruction)
				when 'apo_tecnica'
					import_apo_technical(instruction)
				end
			end	
		end
	end

	def import_technical(instruction)

		id = instruction.match(/(\w+),/)[1]
		name = instruction.match(/'(.+)'/)[1]
		respondent = instruction.match(/,(\w+)/)[1]

		Technical.create! id: id, name: name, respondent: respondent
	end

	def import_apo(instruction)

		id = instruction.match(/(\w+),/)[1]
		name = instruction.match(/.'(.+)','\d*'/)[1]
    text = instruction.match(/','(\d*|\D)'/)[1]
    city = instruction.match(/'\w*','(.+)','/)[1]
    state = instruction.match(/'(.+)','(.+)'/)[2]

    Apo.create! id: id, name: name, text: text, city: city, state: state 
	end

=begin	
	def import_apo_technical(instruction)
		apo = instruction.match(/(\w+),/)[1]
		technical = instruction.match(/,(\w+)/)[1]

		AposTechnical.create! apo: apo, technical_id: technical
	end
=end


end