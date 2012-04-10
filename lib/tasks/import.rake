namespace :import do
  desc "Import AnnotationTypes"
  task :annotation_types => [:environment] do
    annotation_types = [ "original_dateAdded", 
                         "dimensions", 
                         "base_material", 
                         "stock_brand", 
                         "generation_copy", 
                         "date approximate", 
                         "duration_approximate", 
                         "duration_approximate", 
                         "condition_notes", 
                         "Container_information", 
                         "Stylus_size", 
                         "DAVID_Editor", 
                         "DAVID_author", 
                         "LF_turnover", 
                         "10kHz_att", 
                         "Rumble_filter", 
                         "HF_notch", 
                         "DAT2Wav_log", 
                         "DAT2Wav_text", 
                         "DAVID_Description", 
                         "base material", 
                         "stockBrand", 
                         "condition", 
                         "quality", 
                         "Excerpt", 
                         "Brand", 
                         "Parent", 
                         "material", 
                         "Annotation", 
                         "CIP nomination", 
                         "date_added", 
                         "CoreMaterial", 
                         "GrooveSize", 
                         "source", 
                         "provenance", 
                         "Machine", 
                         "generation", 
                         "condition_note", 
                         "Contents", 
                         "duration approximate"
                      ]
    annotation_types.each do |string|
      annotation_type = AnnotationType.find_or_initialize_by_name(string)  
      annotation_type.visible = true
      if annotation_type.save 
        puts "#{annotation_type.name} created and made visible."
      else
        puts "failed to create #{string} because #{annotation_type.errors.full_messages}"
      end
    end
  end
end