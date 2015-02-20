require 'qif/date_format'

module Qif
  # The Qif::Transaction class represents transactions in a qif file.
  class Transaction
    SUPPORTED_FIELDS = {
      :date           => {"D" => "Date"                                                              },
      :action         => {"N" => "Action"                                                            },
      :security         => {"Y" => "Security"                                                    },
      :price         => {"I" => "Price"                                   },
      :quantity          => {"Q" => "Quantity"                                                             },
      :transaction_amount           => {"T" => "Transaction amount"                                                              },
      :cleared_status         => {"C" => "Cleared status" },
      :reminders       => {"P" => "Text in the first line for transfers and reminders"                    },
      :memo       => {"M" => "Memo"                    },
      :commission       => {"O" => "Comission"                    },
      :transfer_account       => {"L" => "Account for the transfer"                    },
      :transfer_amount       => {"$" => "Amount transferred"                    },
      :end            => {"^" => "End of entry"                                                      }
    }
    SUPPORTED_FIELDS.keys.each{|s| attr_accessor s}

    def initialize(attributes = {})
      SUPPORTED_FIELDS.keys.each{|s| instance_variable_set("@#{s.to_s}", attributes[s])}
    end

    # Returns a representation of the transaction as it
    # would appear in a qif file.
    def to_s(format = 'dd/mm/yyyy')
      SUPPORTED_FIELDS.collect do |k,v|
        next unless current = instance_variable_get("@#{k}")
        field = v.keys.first
        case current.class.to_s
        when "Time", "Date", "DateTime"
          "#{field}#{DateFormat.new(format).format(current)}"
        when "Float"
          "#{field}#{'%.2f'%current}"
        when "String"
          current.split("\n").collect {|x| "#{field}#{x}" }
        else
          "#{field}#{current}"
        end
      end.flatten.compact.join("\n")
    end

    private

  end
end
