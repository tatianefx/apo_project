require 'test_helper'

class SqlImporterTest < ActiveSupport::TestCase
	test 'importing technical records' do
		sql = "BEGIN TRANSACTION;\n" \
			"CREATE TABLE tecnica(id int, nome varchar(100), respondente int, primary key(id));\n" \
			"INSERT INTO `tecnica` VALUES (42,'Questionario',2);\n" \
			"INSERT INTO `tecnica` VALUES (67,'Análise Walkthrough',1);\n" \
			"END TRANSACTION"
		
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
			"END TRANSACTION"
		
		SqlImporter.new(sql).import

		assert_equal 1, Apo.count

		assert_not_nil Apo.find(21)
		assert_equal 'APO - IPEA APARTAMENTOS', Apo.find(21).name
		assert_equal '', Apo.find(21).text
		assert_equal 'Uberlândia', Apo.find(21).city
		assert_equal 'Minas Gerais', Apo.find(21).state
	end

=begin
	test 'im apo_technical records' do
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

end