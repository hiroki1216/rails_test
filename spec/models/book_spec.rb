require 'rails_helper'

RSpec.describe Book, type: :model do
  it "trueであるとき、falseになること" do # itの後にNG時に表示される "説明文" を書く
    expect(true).to eq(true)
    # expect(テスト対象コード).to マッチャー(想定テスト結果)
    # マッチャーとはマッチ(一致)するかを判定する道具です
    # マッチャーはここでは==で一致判定するeqをつかっています
  end
  it "Bookモデルをnewしたとき、nilではないこと" do
    expect(Book.new).not_to eq(nil)
  end
  describe "Book#title_with_author" do
    context "Book#titleが文字列のとき" do # 状況を説明する
      it "titleとauthorを結んだ文字列が返ること" do
        book = Book.new(title: "RubyBook", author: "matz")
        expect(book.title_with_author).to eq("RubyBook - matz")
      end
    end
    context "Book#titleがnilのとき" do # 状況を説明する
      it "空のtitleとauthorを結んだ文字列が返ること" do
        book = Book.new(author: "matz")
        expect(book.title_with_author).to eq(" - matz")
      end
    end
  end
  describe "Book#bonus" do
    context "lucky?がtrueのとき" do
      it "チェキが返ること" do
        book = Book.new
        allow(book).to receive(:lucky?).and_return(true)
        expect(book.bonus).to eq("著者サイン入りチェキ")
      end
    end
  end
end