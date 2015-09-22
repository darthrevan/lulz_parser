class SummonerParser

  def initialize(id)
    @summoner = Summoner.find(id)
  end

  def perform
    # position node.css('.left.champion.tooltip a').text
    # name node.css('.left.champion.tooltip a').text
    # icon node.css('.icononly a img').first['src']
    # lss node.css('td.tooltip')[2].text.delete(',').to_i
    # peformance node.css('td.tooltip')[3].text.delete('%').to_f

    # all @document.css('.skinned.champions tr')[1..-1]
    document = open_document
    champions = document.css('.skinned.champions tr')[1..-1]
    champions.each do |node|
      name = node.css('.left.champion.tooltip a').text
      summoner_champion = @summoner.champions.find_or_create_by(name: name)

      summoner_champion.position = node.css('td').first.text
      summoner_champion.icon = node.css('.icononly a img').first['src']
      summoner_champion.lss = node.css('td.tooltip')[2].text.delete(',').to_i
      summoner_champion.performance = node.css('td.tooltip')[3].text.delete('%').to_f
      summoner_champion.save

      Champion.set_role(name, summoner_champion.role) if summoner_champion.role
    end
  end

private

  def open_document
    open("http://www.lolskill.net/summoner/EUW/#{URI.escape(@summoner.name)}/champions") # to force data refresh
    Nokogiri::HTML(open("http://www.lolskill.net/summoner/EUW/#{URI.escape(@summoner.name)}/champions"))
  end

end
