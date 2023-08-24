require_relative "view_client.rb"
require_relative "view_product.rb"
require_relative "view_seller.rb"
require_relative "view_sale.rb"

def printTitle()
    puts "                                                                    "
    puts "********************************************************************"
    puts "                       SALES SYSTEM IN RUBY                         "
    puts "********************************************************************"
end

def printMenu()
    puts "                                                                    "
    puts "                            MENU PRINCIPAL                          "
    puts "Product:  01 - List |  02 - Find |  03 - Insert |  04 - Update"
    puts "Seller:   11 - List |  12 - Find |  13 - Insert |  14 - Update"
    puts "Client:   21 - List |  22 - Find |  23 - Insert |  24 - Update"
    puts "Sales:    31 - List |  32 - Find |  33 - Insert |  34 - Update  |  0 - Exit"
    puts "---------------------------------------------------------------------------------------------------------"
end

def executeView(opcao) 

    case opcao
    when 1
        puts "\nYou selected List of Products:\n"
        ViewProduct.new.list()
    when 2
        puts "\nYou selected Find Product:\n"
        ViewProduct.new.find()
    when 3
        puts "\nYou selected Insert Product:\n"
        ViewProduct.new.insert()
    when 4
        puts "\nYou selected Update Product:\n"
        ViewProduct.new.update()
    when 11
        puts "\nYou selected List of Sellers:\n"
        ViewSeller.new.list()
    when 12
        puts "\nYou selected Find Seller:\n"
        ViewSeller.new.find()
    when 13
        puts "\nYou selected Insert Seller:\n"
        ViewSeller.new.insert()
    when 14
        puts "\nYou selected Update Seller:\n"
        ViewSeller.new.update()
    when 21
        puts "\nYou selected List of clients:\n"
        ViewClient.new.list()
    when 22
        puts "\nYou selected Find Client:\n"
        ViewClient.new.find()
    when 23
        puts "\nYou selected Insert Client:\n"
        ViewClient.new.insert()
    when 24
        puts "\nYou selected Update Client:\n"
        ViewClient.new.update()
    when 31
        puts "\nYou selected List of Sales:\n"
        ViewSale.new.list()
    when 32
        puts "\nYou selected Find Sale:\n"
        ViewSale.new.find()
    when 33
        puts "\nYou selected Insert Sale:\n"
        ViewSale.new.insert()
    when 34
        puts "\nYou selected Update Sale:\n"
        ViewSale.new.update()
    else
        puts "\nInvalid Option!"
    end
end

def main()
    begin
        printTitle()
        continuar = true
        while (continuar) do
            printMenu()
            puts "\nEnter the option:"
            opcao = gets.to_i
            if opcao == 0
                continuar = false
                puts "\nFinalized system!\n"
            else
                begin
                    executeView(opcao) 
                rescue StandardError, AnotherError => e
                    puts "Error: #{e.inspect}"
                ensure
            
                end
            end
        end
    rescue
        puts "\nError!"
        puts "\nFinalized system!\n"
    end
    
end 

main()

