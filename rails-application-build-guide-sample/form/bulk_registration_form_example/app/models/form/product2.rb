# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  code          :string(10)       not null                 # 商品コード
#  name          :string(50)       not null                 # 商品名
#  name_kana     :string(50)       default(""), not null    # 商品名カナ
#  price         :integer          not null                 # 商品価格
#  purchase_cost :integer          not null                 # 仕入原価
#  availability  :boolean          default(FALSE), not null # 販売可能フラグ
#  created_at    :datetime
#  updated_at    :datetime
#

class Form::Product2 < Product2
  REGISTRABLE_ATTRIBUTES = %i(register code name name_kana price purchase_cost)
  attr_accessor :register
end
