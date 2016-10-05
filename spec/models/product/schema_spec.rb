describe Product::Schema do
  describe '#validate' do
    context 'with COMMENTS schema' do
      let(:product_params) {
        { comments_attributes: [
          { comment: 'Comment', timestamp: Time.now.iso8601, tags: [1, 2] },
        ]
        }
      }

      it { expect(Product::Schema.validate product_params).to be_truthy }

      context 'with missing attribute and strict true' do
        before { product_params[:comments_attributes][0].delete(:comment) }

        it { expect(Product::Schema.validate product_params).to be_falsey }
      end

      context 'with insert defaults true' do
        before { product_params[:comments_attributes][0].delete(:tags) }

        it { expect(Product::Schema.validate product_params).to be_truthy }
      end
    end

    context 'with TAGS schema' do
      let(:product_params) { { tags_attributes: ['tag'] } }

      it { expect(Product::Schema.validate product_params, schema: :TAGS).to be_truthy }

      context 'with invalid schema' do
        before { product_params[:tags_attributes] << 1 }

        it { expect(Product::Schema.validate product_params, schema: :TAGS).to be_falsey }
      end
    end
  end
end
