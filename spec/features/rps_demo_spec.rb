
feature 'application setup' do
  feature 'root path' do
    before { visit '/' }
    
    scenario 'is sucessfull' do
      expect(page.status_code).to be 200
    end
    
    scenario 'welcomes the user to the game' do 
      expect(page).to have_content 'Welcome to RPS!'
    end
    
    scenario 'displays a user name input' do
      expect(page).to have_selector "form[action='/play_game']"
      expect(page).to have_selector "input[type='text']"
      expect(page).to have_selector "input[name='name']"
      expect(page).to have_selector "input[type='submit']"
    end
    
    scenario 'routes to /play_game if name is passed in' do 
      fill_in 'name', with: 'Thomas'
      click_button 'submit'
      expect(page.current_path).to eq '/play_game'
    end   
    
    scenario 'does not route to /play_game if no name is passed in' do 
      fill_in 'name', with: ''
      click_button 'submit'
      expect(page.current_path).to_not eq '/play_game'
      expect(page.current_path).to eq '/'
    end   
    
    scenario 'name is stored in a session' do
      fill_in 'name', with: 'Thomas'
      click_button 'submit'
      expect(page).to have_content 'Hello Thomas'
    end
  end
  
  feature 'play the game' do 
    before do
      visit '/'
      fill_in 'name', with: 'Thomas'
      click_button 'submit'
    end
    
    scenario 'dispalys a way for user to make his move' do
      expect(page).to have_selector "form[action='/results']"
      expect(page).to have_selector "input[type='text']"
      expect(page).to have_selector "input[name='move']"
      expect(page).to have_selector "input[type='submit']"
    end
    
    feature 'user makes his choice' do 
      scenario 'routes to /results and displays link' do 
        fill_in 'move', with: 'rock'
        click_button 'submit'
        expect(page.current_path).to eq '/results'
        expect(page.status_code).to be 200
        expect(page).to have_selector "a[href='/play_game']"
      end
      
      scenario 'player wins with rock over scissors' do
        allow(RPS).to receive(:computer_move).and_return('scissors')
        fill_in 'move', with: 'rock'
        click_button 'submit'
        expect(page).to have_content 'computer lost'
      end
      
      scenario 'player looses with rock over paper' do
        allow(RPS).to receive(:computer_move).and_return('paper')
        fill_in 'move', with: 'rock'
        click_button 'submit'
        expect(page).to have_content 'you lost'
      end
    end
  end
  

  
  
end 