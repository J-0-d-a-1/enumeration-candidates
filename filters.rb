# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

require './candidates'

def find(id)
  # Your code Here
  @candidate.find { |candidate| candidate[:id] == id }
end
  
def experienced?(candidate)
  # Your code Here
  candidate[:years_of_experience] >= 2
end

def have_100_or_more_Github_points(candidate)
  candidate[:github_points] >= 100
end

def know_at_least_Ruby_or_Python(candidate)
  candidate[:languages].includes? ('Ruby' || 'Python')
end

def applied_in_the_last_15_days(candidate)
  candidate[:date_applied] <= 15
end

def are_over_the_age_of_17(candidate)
  candidate[:age] > 17
end

def qualified_candidates(candidates)
  # Your code Here
  candidates.select do |candidate|
    experienced?(candidate) &&
    have_100_or_more_Github_points(candidate) &&
    know_at_least_Ruby_or_Python(candidate) &&
    applied_in_the_last_15_days(candidate) &&
    are_over_the_age_of_17(candidate)
  end
end

# More methods will go below
def ordered_by_qualifications(candidates)
  candidates.sort_by do |candidate|
    [-candidate[:years_of_experience], -candidate[:github_points]]
  end
end