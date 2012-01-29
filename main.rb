require "puzzle.rb"


Shoes.app :title => "15 Puzzle", :width => 200, :height => 245 do

  # puzzle init
  p = Puzzle.new
  data = p.data
  s = []
  b =[]
  row = 0
  col = 0
  pos =[]
  

  # add buttons
  data.each do |n|
      s[n] = stack(:top => row*50 ,:left => col*50  ,:width => 50, :height => 50) do

        if !n.zero?

           b[n] = button n.to_s
           b[n].style(:width => 50, :height => 50)
           pos[n] = {"row" => row, "col" => col}


           b[n].click do

             n_pos = p.calc_move_item(pos[n])

              if !n_pos.nil?
                 lt = p.move_item(s[n].left(), s[n].top(), pos[n], n_pos)
                 pos[n] = n_pos

                s[n].move(s[n].left() + lt[1]*50, s[n].top()+lt[0]*50)

                if p.win?

                  Shoes.app :title => "15 Puzzle", :width => 200, :height => 245 do
                    image "./images/smile.jpg"

                    stack(:top => 200, :left => 0) do
                      wb = button "You Won"
                      wb.style(:width => 200, :height => 45)

                      wb.click do
                        self.close()
                      end
                   end
                  end
            
                end

              end
          end
        end

        if (col + 1) % 4 == 0
          row += 1
          col = 0

        else
          col += 1;

        end
    end
  end


# new game
 stack(:top => 210) do
    ng = button "New Game"
    ng.style(:width => 200, :height => 35)

    ng.click do

      # new game
        p = Puzzle.new
        data = p.data
        row = 0
        col = 0


        # add buttons
        data.each do |n|

            s[n].remove()
            s[n] = stack(:top => row*50 ,:left => col*50  ,:width => 50, :height => 50) do

              if !n.zero?

                 b[n] = button n.to_s
                 b[n].style(:width => 50, :height => 50)
                 pos[n] = {"row" => row, "col" => col}

                 b[n].click do

                   n_pos = p.calc_move_item(pos[n])

                    if !n_pos.nil?
                       lt = p.move_item(s[n].left(), s[n].top(), pos[n], n_pos)
                       pos[n] = n_pos

                      s[n].move(s[n].left() + lt[1]*50, s[n].top()+lt[0]*50)

                      if p.win?
                        Shoes.app :title => "15 Puzzle", :width => 200, :height => 245 do
                          image "./images/smile.jpg"

                          stack(:top => 200, :left => 0) do
                            wb = button "You Won"
                            wb.style(:width => 200, :height => 45)
                            
                            wb.click do
                              self.close()
                            end
                          end
                       
                        end

                      end

                    end
                 end
               end
           end

            if (col + 1) % 4 == 0
              row += 1
              col = 0

            else
              col += 1;

            end
       end
    end
 end

end
