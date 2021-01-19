class Api::V1::PrayersController < ApplicationController
    def create
        entry = Entry.find(params[:entry_id])

        prayer = entry.prayers.build(prayer_params)

        if prayer.valid?
            entry.save
            render :json => PrayerSerializer.new(prayer), status: :accepted
        else
            #error message
            render :json => {errors: prayer.errors.full_messages}, status: :unprocessible_entity
        end
    end

    # def update
    #     entry = Entry.find(params[:entry_id])
    #     prayer = Prayer.find(params[:id])
        

    #     if prayer.update(prayer_params)
    #         prayer.save
    #         render :json => {prayer: PrayerSerializer.new(prayer), entry: EntrySerializer.new(entry)}, status: :accepted
    #     else
    #         #error message
    #         render :json => {errors: prayer.errors.full_messages}, status: :unprocessible_entity
    #     end
    # end

    private

    def prayer_params
        params.require(:prayer).permit(:user_id, :entry_id, :prayed)
    end
end
