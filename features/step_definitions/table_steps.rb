#
# Definition of steps usefull in testing tables
#

Then /^I should see the following table rows( in any order)?:?$/ do |unordered, expected_table|
  document = Nokogiri::HTML(page.body)
  rows = document.xpath('//table//tr').collect { |row| row.xpath('.//th|td') }
  expected_table = expected_table.raw
  expected_table.all? do |expected_row|
    first_row = rows.find_index do |row|
      expected_row.all? do |expected_column|
        first_column = row.find_index do |column|
          content = column.content.gsub(/[\r\n\t]+/, ' ').gsub(/[ ]+/, ' ').strip
          content.include? expected_column.gsub('  ', ' ').strip
        end
        if first_column.nil?
          false
        else
          row = row[(first_column + 1)..-1]
          true
        end
      end
    end
    if first_row.nil?
      false
    else
      if unordered
        rows.delete_at(first_row)
      else
        rows = rows[(first_row + 1)..-1]
      end
      true
    end
  end.should be_true
end

When /^I follow "([^"]*)" in row with "([^"]*)" within "([^"]*)" table$/ do |link, something_from_row, selector|
	within(:xpath, "//table[@id = '#{selector}']//tr[td[contains(text(), '#{something_from_row}')]]") do
		click_link(link)
	end
end
