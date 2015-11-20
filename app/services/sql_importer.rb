class SqlImporter

	TABLES_MAP = {
		'tecnica' => Technical,
		'apo' => Apo
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
    state = instruction.match(//)

    Apo.create! id: id, name: name, text: text, city: city, state: state 
	end
end