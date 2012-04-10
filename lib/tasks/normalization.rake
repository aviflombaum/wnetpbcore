namespace :normalization do
  desc 'Normalize Annotation Types in the annotations table based on AnnotationTypes'
  task :annotation_types => [:environment] do
    annotations_to_normalize = Annotation.find(:all, :conditions => ["annotation_type NOT IN (?)", AnnotationType.find(:all).map(&:name)])
    annotations_to_normalize.each_with_index do |annotation, index|
      annotation.annotation = "#{annotation.annotation}\n\nannotation_type:#{annotation.annotation_type}"
      annotation.annotation_type = nil
      if annotation.save
        puts "Updated #{annotation.id} (#{index}/#{annotations_to_normalize.size}) - #{annotation.annotation}"
      else
        puts "Failed to update #{annotation.id}"
      end
    end
  end
end