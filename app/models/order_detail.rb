class OrderDetail < ApplicationRecord
  belongs_to :cart_items
  belongs_to :items

    enum making_status: { "着手不可": 0, "製作待ち": 1, "製作中": 2, "製作完了": 3 }

end