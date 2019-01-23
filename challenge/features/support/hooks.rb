#Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle

Before do
  @busca = BuscaPage.new
end

Before do |scenario|
  # The +scenario+ argument is optional, but if you use it, you can get the title,
  # description, or name (title + description) of the scenario that is about to be
  # executed.
end

After do |scenario|
  nome_cenario = scenario.name.tr(' ', '_').downcase! #downcase é para ficar em caixa baixa
  nome_cenario = nome_cenario.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/,'') #expressão regular do rby, substitui todos esses caracteres por espaço em branco para não dar erro na hora de gerar o nome do screenshot
  screenshot = "features/logs/shots/#{nome_cenario}.png"
  page.save_screenshot(screenshot)
  embed(screenshot, 'image/png', 'Clique aqui para ver a evidência') #para anexar o screenshot ao relatório
end

#Tagged hooks

Before('@Ex_tag1 or @Ex_tag2') do
  # This will only run before scenarios tagged
  # with @Ex_tag1 OR @Ex_tag2.
end

AfterStep('@Ex_tag1 or @Ex_tag2') do |scenario|
  # This will only run after steps within scenarios tagged
  # with @Ex_tag1 AND @Ex_tag2.
end

Around('@Ex_tag1') do |scenario, block|
  # Will round around a scenario
end

AfterConfiguration do |config|
  # Will run after cucumber has been configured
end

# # Quit the selenium driver from the example tests.
# at_exit do
#   close_driver()
# end
