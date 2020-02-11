class CommandLineInterface

    def greet
        puts "________________"

        puts "Welcome to Tech Hunter"
       

        puts "________________"
    end

#main menue here the user is asked to imput name if exist the user will diplay next 
#method mainscreen else ...

    def menu

        puts "________________"

        puts "insert the user name to continue"
        @user_name  = gets.chomp
        response = User.find_by(user_name: @user_name)

        puts "________________"

        if response
           
            mainscreen
        else
            puts "try again"
          menu
        end
    end   
    
    def mainscreen
        puts "____________________________________________"

        puts "Welcome back #{@user_name}"

       puts "____________________________________________"

       puts "
            Where would you like to go?

            1. Order history
            2. Create a new order
            3. Go back to the login page
            "

     puts "____________________________________________"


        

         
        if gets.chomp.to_i == 1
        order_history
        else
            puts "option not avaliable"
    
        end
       
    end

  
    def order_history

        puts "welcome to your order history"
        user_instance = User.all.find_by(user_name:@user_name)
        @user_id = user_instance.id
        @orders_instance = Order.all.find_by(user_id: @user_id)
        @product_id =  @orders_instance.product_type
        product_instance = Product.find_by(id: @product_id)
       user_product =  product_instance.product_type
       user_product_price = product_instance.product_price

       puts "____________________________________________"

    #    puts user_product 

    #    puts user_product_price

       puts "You have ordered a #{user_product}, for £#{user_product_price}."
        
       puts "____________________________________________"
   
        
       end





end