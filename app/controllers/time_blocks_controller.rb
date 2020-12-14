class TimeBlocksController < ApplicationController
  before_action :set_time_block, only: %i[show edit update destroy]
  before_action :authenticated?

  def index
    @time_blocks = current_user.time_blocks
  end

  def show; end

  def new
    @time_block = current_user.time_blocks.build
    @groups = Group.all
  end

  def edit
    @groups = Group.all
  end

  def create
    @time_block = current_user.time_blocks.create!(time_block_params)

    respond_to do |format|
      if @time_block.save
        format.html { redirect_to @time_block, notice: 'Time block was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @time_block.update(time_block_params)
        format.html { redirect_to @time_block, notice: 'Time block was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @time_block.destroy
    respond_to do |format|
      format.html { redirect_to time_blocks_url, notice: 'Time block was successfully destroyed.' }
    end
  end

  private

  def set_time_block
    @time_block = TimeBlock.find(params[:id])
    redirect_to current_user, notice: 'Access Forbidden' unless current_user.time_blocks.include?(@time_block)
  end

  def time_block_params
    params.require(:time_block).permit(:name, :amount, :group_list)
  end
end
