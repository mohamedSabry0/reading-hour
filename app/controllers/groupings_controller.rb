class GroupingsController < ApplicationController
  def create
    @time_block = TimeBlock.find(params[:time_block_id])
    @time_blocks.groups.push(groups.find(params[:group_id]))

    if @time_block.save
      redirect_to time_block_path(@time_block), notice: 'added group'
    else
      redirect_to time_block_path(@time_block), notice: 'adding group failed'
    end
  end

  def destroy
    @grouping = Grouping.find(params[:id])
    @grouping.destroy
    redirect_to root_path, notice: 'Deleted the group!'
  end
end
