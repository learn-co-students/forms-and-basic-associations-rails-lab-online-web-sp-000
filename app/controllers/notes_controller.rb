class NotesController < ApplicationController::Base

    def create
        Note.create(note_params)
    end

    private 

    def note_params
        params.require(:note).permit(:content)
    end
end