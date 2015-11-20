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

		assert_not_nil Technical.find(21)
		assert_equal 'APO - IPEA APARTAMENTOS', Technical.find(21).name
		assert_equal '', Technical.find(21).text
		assert_equal 'Uberlândia', Technical.find(21).city
		assert_equal 'Minas Gerais', Technical.find(21).state
	end

end