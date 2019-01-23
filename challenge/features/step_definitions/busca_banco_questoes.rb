
Dado('que eu navego para a página de busca do banco de questões') do
    @busca.acessar_page_busca
end

Dado('digito {string} no campo de busca') do |questao|
  @busca.input_search.set questao
end

Dado('seleciono o valor {string} no campo do tipo de busca') do |opcao_combo|
  @busca.combo_type.find('option', text: opcao_combo).select_option
end

Quando('eu clicar no botão de buscar') do
  @busca.btn_search.click
end

Então('deve aparecer uma mensagem de erro com o texto {string}') do |alerta|
  expect(@busca.alert_area).to have_content alerta
end

Então('deve aparecer a listagem de questões com {int} itens') do |itens|
  expect(all('.table.table-bordered > tbody > tr').count).to eq(itens)
end

Então('deve aparecer o controle de paginação') do
  expect(page).to have_css('.pagination.pagination-lg')
end

Então('deve aparecer a listagem de questões com menos de {int} itens') do |itens|
  expect(page).to have_css('.table.table-bordered > tbody > tr', :maximum => (itens-1))
end

Então('não deve aparecer o controle de paginação') do
  expect(page).not_to have_css('.pagination.pagination-lg')
end