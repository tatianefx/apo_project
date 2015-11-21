class SqlImporter

	TABLES_MAP = {
		'apo' => Apo,
#		'apo_tecnica' => AposTechnical,
		'atributo' => Attribute,
		'categoria' => Category,
		'comodo' => Room,
		'conceito' => Concept,
#		'conceito_pergunta' => AnswersConcept,
#		'conceito_qualificador' => ConceptsQualifier,
		'morador' => Resident,
		'pergunta' => Question,
#		'pergunta_atributo' => AnswersAttribute,
#		'pergunta_categoria' => AnswersCategory,
#		'pergunta_comodo' => AnswersRoom,
#		'pergunta_qualificador' => AnswersQualifier,
		'qualificador' => Qualifier,
		'resposta' => Answer,
		'tecnica' => Technical
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
				when 'atributo'
					import_attribute(instruction)
				when 'categoria'
					import_category(instruction)
				when 'comodo'
					import_room(instruction)
				when 'conceito'
					import_concept(instruction)
				when 'morador'
					import_resident(instruction)
				when 'pergunta'
					import_question(instruction)
				when 'qualificador'
					import_qualifier(instruction)
				when 'resposta'
					import_answer(instruction)
				end

			end	
		end
	end

	def import_technical(instruction)

		id = instruction.match(/\((\w+),/)[1]
		name = instruction.match(/'(.+)'/)[1]
		respondent = instruction.match(/,(\w+)/)[1]

		Technical.create! id: id, name: name, respondent: respondent
	end

	def import_apo(instruction)

		id = instruction.match(/\((\w+),/)[1]
		name = instruction.match(/.'(.+)','\.*'/)[1]
    text = instruction.match(/,'(\.*)'/)[1]
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

	def import_attribute(instruction)
		id = instruction.match(/\((\w+),/)[1]
		name = instruction.match(/'(.+)'/)[1]

		Attribute.create! id: id, name: name
	end

	def import_category(instruction)
		id = instruction.match(/\((\w+),/)[1]
		name = instruction.match(/'(.+)'/)[1]

		Category.create! id: id, name: name
	end

	def import_room(instruction)
		id = instruction.match(/\((\w+),/)[1]
		name = instruction.match(/'(.+)'/)[1]
		type_room = instruction.match(/,(\w+)/)[1]

		Room.create! id: id, name: name, type_room: type_room
	end

	def import_concept(instruction)
		id = instruction.match(/\((\w+),/)[1]
		name = instruction.match(/'(.+)'/)[1]
		order = instruction.match(/,(\w+)/)[1]

		Concept.create! id: id, name: name, order: order
	end

	######## O ID NAO PODE SER NULO: TEM Q ARRUMAR ISSO ######
	def import_resident(instruction)
		id = instruction.match(/\((\w+),/)[1]
		apartment_number = instruction.match(/.'(.+)','\.*'/)[1]
    block = instruction.match(/,'(\.*)'/)[1]
    apo_id = instruction.match(/,(\w+),/)[1]
    time_answer = instruction.match(/'.*',\w+,'(.+)'/)[1]
    synchronized = instruction.match(/',(\w+)\)/)[1]

    if synchronized == 'NULL'
    	Resident.create! id: 5, apartment_number: apartment_number, block: block, apo_id: apo_id, time_answer: time_answer
    else
    	Resident.create! id: 5, apartment_number: apartment_number, block: block, apo_id: apo_id, time_answer: time_answer, synchronized: synchronized    	
    end
	end
	############################################################

	def import_question(instruction)
		id = instruction.match(/\((\w+),/)[1]
		text = name = instruction.match(/'(.+)'/)[1]
    type_question = instruction.match(/,(\w+),/)[1] 
    order = instruction.match(/\w+,(\w+)/)[1]
    scale_colors = instruction.match(/,(\w+)\)/)[1]

    Question.create! id: id, text: text, type_question: type_question, order: order, scale_colors: scale_colors
	end

	def import_qualifier(instruction)
		id = instruction.match(/\((\w+),/)[1]
		text = instruction.match(/'(.+)'/)[1]
    begin_ = instruction.match(/',(\w+)/)[1] 
    end_ = instruction.match(/,(\w+)\)/)[1]

    Qualifier.create! id: id, text: text, begin_: begin_, end_: end_ 
	end

	######## O ID NAO PODE SER NULO: TEM Q ARRUMAR ISSO ######
	def import_answer(instruction)
		id = instruction.match(/\((\w+),/)[1]
		resident_id = instruction.match(/\(\w+,(\w+),/)[1]
    question_id = instruction.match(/,\w+,(\w+),'/)[1]
    text = instruction.match(/'(.+)'/)[1]
    apo_id = instruction.match(/',(\w+),/)[1]
    room_id = instruction.match(/',\w+,(\w+),/)[1]
    concept_id = instruction.match(/',\w+,\w+,(\w+),/)[1]
    attribute_id = instruction.match(/(\w+),\w+\)/)[1]
    synchronized = instruction.match(/,(\w+)\)/)[1]

    if synchronized == 'NULL'
			Answer.create! id: 5, resident_id: resident_id, question_id: question_id, text: text, apo_id: apo_id, room_id: room_id, concept_id: concept_id, attribute_id: attribute_id    	
		else
    	Answer.create! id: 5, resident_id: resident_id, question_id: question_id, text: text, apo_id: apo_id, room_id: room_id, concept_id: concept_id, attribute_id: attribute_id, synchronized: synchronized
		end
	end
	############################################################

end