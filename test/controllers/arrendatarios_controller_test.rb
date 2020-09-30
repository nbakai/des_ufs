require 'test_helper'

class ArrendatariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @arrendatario = arrendatarios(:one)
  end

  test "should get index" do
    get arrendatarios_url, as: :json
    assert_response :success
  end

  test "should create arrendatario" do
    assert_difference('Arrendatario.count') do
      post arrendatarios_url, params: { arrendatario: { fecha_id: @arrendatario.fecha_id, name: @arrendatario.name, valor_arriendo: @arrendatario.valor_arriendo, valor_total: @arrendatario.valor_total } }, as: :json
    end

    assert_response 201
  end

  test "should show arrendatario" do
    get arrendatario_url(@arrendatario), as: :json
    assert_response :success
  end

  test "should update arrendatario" do
    patch arrendatario_url(@arrendatario), params: { arrendatario: { fecha_id: @arrendatario.fecha_id, name: @arrendatario.name, valor_arriendo: @arrendatario.valor_arriendo, valor_total: @arrendatario.valor_total } }, as: :json
    assert_response 200
  end

  test "should destroy arrendatario" do
    assert_difference('Arrendatario.count', -1) do
      delete arrendatario_url(@arrendatario), as: :json
    end

    assert_response 204
  end
end
