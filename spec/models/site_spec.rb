require "rails_helper"

describe Site do
  let(:site) { Site.create(name: 'Test') }
 
  it "orders by last name" do
    expect(site).to be_valid
  end

  it 'default scope created_at DESC' do
    first_article = site.articles.create(title: 'First')
    5.times {|a| Article.create(title: "test " + a.to_s, site: site)}
    expect(site.articles.size).to eq(6)
    first = site.articles.find_by(title: 'First')
    expect(site.articles.last).to eq(first)
  end
  
  it "#next_article" do
    first_article = site.articles.create(title: 'First')
    5.times {|a| Article.create(title: "test " + a.to_s, site: site)}
    last = site.articles.last
    next_last = site.articles.last(2).first

    expect(site.next_article(last)).to eq([next_last.id, last.id])
  end

  it "#next_article without category" do
    first_article = site.articles.create(title: 'First')
    5.times {|a| Article.create(title: "test " + a.to_s, site: site)}
    last = site.articles.last
    next_last = site.articles.last(2).first

    expect(site.next_article(last, nil)).to eq([next_last.id, last.id])
  end
end