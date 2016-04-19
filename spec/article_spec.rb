describe Article do
  describe "#send_mail?" do
    it "should return true when status_was is assigned and status is approved or rejected" do
    #given the follow conditions, should return true
    #  status_was == :assigned && (self.status == :approved || self.status == :rejected)
      article = Article.new
      article.status_was = :assigned
      article.status = :approved
      expect(article.send_email?).to eq(true)
      article.status = :rejected
      expect(article.send_email?).to eq(true)
    end

    it "should return true when status_was is review and status is approved or rejected" do
    # self.status_was == :review && (self.status == :approved || self.status == :rejected)
      article = Article.new
      article.status_was = :review
      article.status = :approved
      expect(article.send_email?).to eq(true)
      article.status = :rejected
      expect(article.send_email?).to eq(true)
    end

    it "should return true when status_was is approved and status is rejected" do
      # self.status_was == :approved && self.status == :rejected
      article = Article.new
      article.status_was = :approved
      article.status = :rejected
      expect(article.send_email?).to eq(true)
    end

    it "should return true when status_was is rejected and status is approved" do
      # self.status_was == :rejected && self.status == :approved
      article = Article.new
      article.status_was = :rejected
      article.status = :approved
      expect(article.send_email?).to eq(true)
    end

    it "should return true when status_was is not followup and status is followup" do
      # self.status_was != :followup && self.status == :followup && self.fact_checked?
      article = Article.new
      article.status_was != :followup
      article.status = :followup
      article.fact_checked = true
      expect(article.send_email?).to eq(true)
    end

    it "should return true when status_was is not review and status is review" do
      # self.status_was != :review && self.status == :review
      article = Article.new
      article.status_was != :review
      article.status = :review
      expect(article.send_email?).to eq(true)
    end


  end
end
