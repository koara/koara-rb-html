require 'koara'
require 'koara/html/html5renderer'
require 'minitest/autorun'

class Html5RendererTest < MiniTest::Unit::TestCase

  def setup
    @parser = Koara::Parser.new
    @renderer = Koara::Html::Html5Renderer.new()
  end

  def test_render
    @document = @parser.parse('Test')
    @document.accept(@renderer)
    assert_equal("<p>Test</p>", @renderer.output)
  end

  def test_render_hardwrap_true
    @renderer.hard_wrap = true;
    @document = @parser.parse("a\nb")
    @document.accept(@renderer)
    assert_equal("<p>a<br>\nb</p>", @renderer.output)
  end

  def test_no_partial_result
    expected = "<!DOCTYPE html>\n"
    expected << "<html>\n";
    expected << "  <body>\n";
    expected << "    <p>Test</p>\n";
    expected << "  </body>\n";
    expected << "</html>\n";

    @renderer.partial = false;
    @document = @parser.parse('Test')
    @document.accept(@renderer)
    assert_equal(expected, @renderer.output)
  end

  def test_heading_ids_true
    @renderer.heading_ids = true;
    @document = @parser.parse('= A')
    @document.accept(@renderer)
    assert_equal("<h1 id=\"a\">A</h1>", @renderer.output)
  end

  def test_heading_ids_true_multiple_words
    @renderer.heading_ids = true;
    @document = @parser.parse('= This is a test')
    @document.accept(@renderer)
    assert_equal("<h1 id=\"this_is_a_test\">This is a test</h1>", @renderer.output)
  end

end