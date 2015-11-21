require 'test_helper'

class SqlImporterTest < ActiveSupport::TestCase

	test 'importing technical records' do
		sql = "BEGIN TRANSACTION;\n" \
			"CREATE TABLE tecnica(id int, nome varchar(100), respondente int, primary key(id));\n" \
			"INSERT INTO `tecnica` VALUES (42,'Questionario',2);\n" \
			"INSERT INTO `tecnica` VALUES (67,'Análise Walkthrough',1);\n" \
			"COMMIT;"
		
		SqlImporter.new(sql).import

		assert_equal 2, Technical.count
		
		assert_not_nil Technical.find(42)
		assert_equal 'Questionario', Technical.find(42).name
		assert_equal 2, Technical.find(42).respondent

		assert_not_nil Technical.find(67)
		assert_equal 'Análise Walkthrough', Technical.find(67).name
		assert_equal 1, Technical.find(67).respondent
	end

	test 'importing apo records' do
		sql = "BEGIN TRANSACTION;\n" \
			"CREATE TABLE tecnica(id int, nome varchar(100), respondente int, primary key(id));\n" \
			"INSERT INTO `apo` VALUES (21,'APO - IPEA APARTAMENTOS','','Uberlândia','Minas Gerais');\n" \
			"COMMIT;"
		
		SqlImporter.new(sql).import

		assert_equal 1, Apo.count

		assert_not_nil Apo.find(21)
		assert_equal 'APO - IPEA APARTAMENTOS', Apo.find(21).name
		assert_equal '', Apo.find(21).text
		assert_equal 'Uberlândia', Apo.find(21).city
		assert_equal 'Minas Gerais', Apo.find(21).state
	end

=begin
	test 'importing apo_technical records' do
		sql = "BEGIN TRANSACTION;\n" \
			"CREATE TABLE tecnica(id int, nome varchar(100), respondente int, primary key(id));\n" \
			"INSERT INTO `apo_tecnica` VALUES (21,42);\n" \
			"END TRANSACTION"

		SqlImporter.new(sql).import

		assert_equal 1, AposTechnical.count

		assert_not_nil AposTechnical.find([21,42])

		assert_equal 21, AposTechnical.find([21,42]).apo_id
		assert_equal 42, AposTechnical.find([21,42]).technical_id
	end
=end

	test 'importing attribute records' do
		sql = "BEGIN TRANSACTION;\n" \
			"CREATE TABLE tecnica(id int, nome varchar(100), respondente int, primary key(id));\n" \
			"INSERT INTO `atributo`- VALUES (178,'Acima de 1000 metros (acima de 10 quarteirões)');\n" \
			"COMMIT;"

		SqlImporter.new(sql).import

		assert_equal 1, Attribute.count
		
		assert_not_nil Attribute.find(178)
		assert_equal 'Acima de 1000 metros (acima de 10 quarteirões)', Attribute.find(178).name
	end

	test 'importing category records' do
		sql = "BEGIN TRANSACTION;\n" \
			"CREATE TABLE tecnica(id int, nome varchar(100), respondente int, primary key(id));\n" \
			"INSERT INTO `categoria` VALUES (274,'CONJUNTO / QUARTEIRÃO');\n" \
			"COMMIT;"

		SqlImporter.new(sql).import

		assert_equal 1, Category.count
		
		assert_not_nil Category.find(274)
		assert_equal 'CONJUNTO / QUARTEIRÃO', Category.find(274).name
	end
	
	test 'importing room records' do
		sql = "BEGIN TRANSACTION;\n" \
			"CREATE TABLE tecnica(id int, nome varchar(100), respondente int, primary key(id));\n" \
			"INSERT INTO `comodo` VALUES (49,'Sala',3);\n" \
			"COMMIT;"

		SqlImporter.new(sql).import

		assert_equal 1, Room.count
		
		assert_not_nil Room.find(49)
		assert_equal 'Sala', Room.find(49).name
		assert_equal 3, Room.find(49).type_room
	end

	test 'importing concept records' do
		sql = "BEGIN TRANSACTION;\n" \
			"CREATE TABLE tecnica(id int, nome varchar(100), respondente int, primary key(id));\n" \
			"INSERT INTO `conceito` VALUES (131,'Sua aparência, beleza',0);\n" \
			"COMMIT;"

		SqlImporter.new(sql).import

		assert_equal 1, Concept.count
		
		assert_not_nil Concept.find(131)
		assert_equal 'Sua aparência, beleza', Concept.find(131).name
		assert_equal 0, Concept.find(131).order
	end

	######## O ID NAO PODE SER NULO: TEM Q ARRUMAR ISSO ######
	test 'importing resident records' do
		sql = "BEGIN TRANSACTION;\n" \
			"CREATE TABLE tecnica(id int, nome varchar(100), respondente int, primary key(id));\n" \
			"INSERT INTO `morador` VALUES (NULL,'566778888888999','',27,'0min e 41s',NULL);\n" \
			"COMMIT;"

		SqlImporter.new(sql).import

		assert_equal 1, Resident.count
		
		assert_not_nil Resident.find(5)
		assert_equal '566778888888999', Resident.find(5).apartment_number
		assert_equal '', Resident.find(5).block
		assert_equal 27, Resident.find(5).apo_id
		assert_equal '0min e 41s', Resident.find(5).time_answer
		assert_equal nil, Resident.find(5).synchronized
	end
	##########################################################

	test 'importing question records' do
		sql = "BEGIN TRANSACTION;\n" \
			"CREATE TABLE tecnica(id int, nome varchar(100), respondente int, primary key(id));\n" \
			"INSERT INTO `pergunta` VALUES (814,'Qual seu grau de escolaridade?',3,0,0);\n" \
			"COMMIT;"

		SqlImporter.new(sql).import

		assert_equal 1, Question.count
		
		assert_not_nil Question.find(814)
		assert_equal 'Qual seu grau de escolaridade?', Question.find(814).text
		assert_equal 3, Question.find(814).type_question
		assert_equal 0, Question.find(814).order
		assert_equal 0, Question.find(814).scale_colors
	end

	test 'importing qualifier records' do
		sql = "BEGIN TRANSACTION;\n" \
			"CREATE TABLE tecnica(id int, nome varchar(100), respondente int, primary key(id));\n" \
			"INSERT INTO `qualificador` VALUES (3767,'Totalmente Satisfatório',0,0);\n" \
			"COMMIT;"

		SqlImporter.new(sql).import

		assert_equal 1, Qualifier.count
		
		assert_not_nil Qualifier.find(3767)
		assert_equal 'Totalmente Satisfatório', Qualifier.find(3767).text
		assert_equal 0, Qualifier.find(3767).begin_
		assert_equal 0, Qualifier.find(3767).end_
	end

	######## O ID NAO PODE SER NULO: TEM Q ARRUMAR ISSO ######
	test 'importing answer records' do
		sql = "BEGIN TRANSACTION;\n" \
			"CREATE TABLE tecnica(id int, nome varchar(100), respondente int, primary key(id));\n" \
			"INSERT INTO `resposta` VALUES (NULL,1,859,'Médio',21,0,133,0,NULL);\n" \
			"COMMIT;"

		SqlImporter.new(sql).import

		assert_equal 1, Answer.count

		assert_not_nil Answer.find(5)
		assert_equal 1, Answer.find(5).resident_id
		assert_equal 859, Answer.find(5).question_id
		assert_equal 'Médio', Answer.find(5).text
		assert_equal 21, Answer.find(5).apo_id
		assert_equal 0, Answer.find(5).room_id
		assert_equal 133, Answer.find(5).concept_id
		assert_equal 0, Answer.find(5).attribute_id
		assert_equal nil, Answer.find(5).synchronized
	end
	##########################################################

end