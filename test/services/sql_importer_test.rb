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
		assert_equal 3, Room.find(49).type
	end
end