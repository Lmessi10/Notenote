class NotesController < ApplicationController

  def index
    @notes = Note.where(user_id: current_user)
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = current_user.notes.build
  end

  def create 
    @note = current_user.notes.build(notes_params)

    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def  update
    @note = Note.find(params[:id])   

    if @note.update(notes_params)
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
      redirect_to notes_path
  end

  private

  def notes_params
    params.require(:note).permit(:title, :content)
  end
end
