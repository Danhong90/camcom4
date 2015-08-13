class BrownController < ApplicationController
  
  def main
    @bunny = "fat"
    @posts = Post.all
    
    if !current_user.nil?
      userhash = Userhashrel.where("user_id = ?", current_user.id)
      @usermango = []
      @usermelon = []
      
      userhash.each do |usershash|
        if usershash.pick_type == 0
          @usermango << usershash.campushash_id
        elsif usershash.pick_type == 1
          @usermelon << usershash.campushash_id
        end
     end
      
      mangolist = Postuserrel.order(mango: :desc).pluck(:post_id)
    
    end
    
  end
  
  def search 
  
  end
  
  def post_new     #p는 이름짓기 귀찮아서 선언한 변수명입니다 문제가 있으면 아무렇게나 바꿀 수 있습니다
    due_date = params[:deadline]
    input_hash = params[:hash].split(' ')
    p = Post.new
    p.post_image = params[:imageurl]
    p.post_category = params[:category]
    p.post_company = params[:company]
    p.post_subject = params[:subject]
    p.post_deadline = due_date["date"]
    p.post_content = params[:content]
    p.save
    
    input_hash.each do |hash|
      Campushash.find_or_create_by(hash_content: hash)
      
    end
    
    input_hash.each do |hash|
      post_hash_rel = Posthashrel.new
      post_hash_rel.post_id = p.id
      post_hash_rel.campushash_id = Campushash.find_by(hash_content: hash).id
      post_hash_rel.save
    end
    
    
    redirect_to '/brown/newpost'
    
    
  end

  def post_list
    @posts = Post.all
    
    if !params[:id].nil?    
    p = Post.find(params[:id])
    p.destroy
    redirect_to '/brown/post_list'
    end
          
  end
  
  def pickhash
    hashinput = params[:id].to_i
    postinput = params[:postid].to_i
    pick = Userhashrel.where("user_id= ? and campushash_id= ?", current_user.id, hashinput).take
    
    userpickmango = Userhashrel.where("user_id =? and pick_type =?", current_user.id, 0).pluck(:campushash_id)
    userpickmelon = Userhashrel.where("user_id=? and pick_type=?", current_user, 1).pluck(:campushash_id)
    
    #post의 우선순위를 위한 mango melon 점수 부여
      
    postpick = Postuserrel.where("post_id = ? and user_id = ?", postinput, current_user.id).take
    hashpost = Posthashrel.where("post_id=?", postinput).pluck(:campushash_id)
    postpick.mango = (userpickmango&hashpost).size
    postpick.melon = (userpickmelon&hashpost).size
    postpick.save
    
    if postpick.nil?
      postpick = Postuserrel.new
      postpick.user_id = current_user.id
      postpick.post_id = postinput
      postpick.save
      postpick = Postuserrel.where("post_id = ? and user_id = ?", postinput, current_user.id).take
    end
    
    
    
    if pick.nil?
    
      picked_hash = Userhashrel.new
      picked_hash.user_id = current_user.id
      picked_hash.campushash_id = hashinput
      picked_hash.pick_type = 0
      picked_hash.save
            
      elsif pick.pick_type == 0               #원래 망고인 것이 들어오면 1 더해줌
        pick.pick_type = pick.pick_type + 1
        pick.save
        
        
      else pick.pick_type  > 0                #원래 멜론이 들어오면 
          pick.destroy

    end
    
    redirect_to '/'
    
  end
  
  def user_hash 
    if !current_user.nil?
      userhash = Userhashrel.where("user_id = ?", current_user.id)
      @usermango = []
      @usermelon = []
      userhash.each do |usershash|
        if usershash.pick_type == 0
          @usermango << usershash.campushash_id
        elsif usershash.pick_type == 1
          @usermelon << usershash.campushash_id
        end
      end  
    end
  
  
  end
  
  
  
  
end
