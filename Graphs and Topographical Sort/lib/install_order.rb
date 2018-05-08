# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to



def install_order(arr)
    # Arr_Item[0] = package_id
    # Arr_Item[1] = dependency_id
    sorted = []
    package_hash = {}
    dependency_hash = {}
    sorted_hash = {}
    pkg_max = 0
    pkg_min = nil

    arr.each do |pkg| 
        package_hash[pkg[0]] = true 
        # package_hash[pkg[1]] = true 
        dependency_hash[pkg[1]] = true
        pkg_min ||= pkg[0]
        pkg_max = pkg[0] if pkg[0] > pkg_max
        pkg_max = pkg[1] if pkg[1] > pkg_max
        pkg_min = pkg[0] if pkg[0] < pkg_min
        pkg_min = pkg[1] if pkg[1] < pkg_min
    end

    # Push in all without dependencies
    (pkg_min..pkg_max).each do |pkg|
        if !package_hash[pkg] 
            sorted << pkg 
            package_hash.delete(pkg)
            dependency_hash.delete(pkg)
            sorted_hash[pkg] = true
        else
            package_hash[pkg] = true
        end
    end

    until sorted.length == (pkg_min..pkg_max).size
        # debugger
        add_queue = arr.select do |pkg| 
            # (dependency_hash[pkg[0]] && sorted_hash[pkg[1]]) ||
            # (sorted_hash[pkg])
            # !package_hash.include?(pkg[1]) && !sorted_hash.include?(pkg[0])
            sorted_hash[pkg[1]]
        end

        add_queue.each do |pkg|
            sorted << pkg[0] unless sorted_hash[pkg[0]]
            sorted_hash[pkg[0]] = true
            package_hash.delete(pkg[0]) if package_hash[pkg[0]]
        end
    end
    # debugger
    p sorted
    sorted
end
