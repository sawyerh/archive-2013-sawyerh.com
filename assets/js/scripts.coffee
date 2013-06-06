$ ->

	$('.nav-item').hover ->
		$('.nav-item').addClass('is-highlighted')
	, ->
		$('.nav-item').removeClass('is-highlighted')



	# Portfolio items
	# ============================================================

	# Transition through items when is-front is clicked
	togglePortfolioItem = (item) ->
		item.removeClass('is-front')

		if item.parent().children().length == 1
			return

		item.removeClass('is-front')
		if item.next('.p-item').length > 0
			# Go back in the stack
			item.next('.p-item').addClass('is-front')
		else
			# Return to bottom stack
			item.parent().find('.p-item:first').addClass('is-front')



	# Click interactions
	# ============================================================
	$(document).on 'click', '.p-item img', ->
		$this = $(this).parents('.p-item')

		if $this.hasClass('is-front')
			togglePortfolioItem($this)
		else
			$this.parents('.portfolio-item-wrap').find('.is-front').removeClass('is-front')
			$this.addClass('is-front')

	formatPortfolioItems = ->
		return if $(window).width() < 560
		
		$('.portfolio-item-wrap').each ->
			$container = $(this)
			containerHeight = 0

			$container.find('.p-item').each ->
				$item = $(this)
				itemHeight = $item.height() + $item.position().top + parseInt($item.css('marginTop'))

				if itemHeight > containerHeight
					containerHeight = Math.ceil(itemHeight)

			$container.css('minHeight', containerHeight)



	# Set height on containers
	# ============================================================
	$('.p-item-outer-wrap').imagesLoaded ->
		formatPortfolioItems()
	.smartresize ->
		formatPortfolioItems()



	# Toggle portfolio item info overlay
	# ============================================================
	$('.p-info-toggle').on 'click', ->

		$currentInfo = $('.p-info-wrap.is-visible')
		$info = $(this).parents('.p-item-outer-wrap').find('.p-info-wrap')

		if $info != $currentInfo
			$currentInfo.removeClass('is-visible').hide()

		$info.fadeToggle().addClass('is-visible')

	$('.p-info-hide').on 'click', ->
		$(this).parents('.p-item-outer-wrap').find('.p-info-wrap').fadeOut().removeClass('is-visible')

	$('.p-info-wrap').on 'click', (e) ->
		targetClass = e.target.className

		if targetClass == 'p-info' || targetClass == 'p-info-wrap'
			$(this).fadeToggle()