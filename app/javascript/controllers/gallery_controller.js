import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [
        "themeSelect", "imageName", "image",
        "aveValue", "valuesQty", "rateStatus", "favBtn",
        "rateScale", "rateDone", "userValue",
        "slider", "sliderValue", "viewer", "panel"
    ]

    connect() {
        this.titles = []
        this.index = 0

        const params = new URLSearchParams(window.location.search)
        const themeId = params.get("theme_id")

        if (themeId) {
            this.themeSelectTarget.value = themeId
            this.loadTheme(themeId)
        }
    }

    selectTheme(event) {
        const themeId = event.target.value
        this.updateUrl(themeId)

        if (!themeId) {
            this.titles = []
            this.clear()
            return
        }

        this.loadTheme(themeId)
    }

    async loadTheme(themeId) {
        const response = await fetch(`/api/theme_titles?theme_id=${themeId}`)
        const data = await response.json()

        this.titles = [
            ...data.titles.filter(t => !t.user_value),
            ...data.titles.filter(t => t.user_value)
        ]
        this.index = 0
        this.render()

        this.viewerTarget.classList.remove("is-hidden")
        this.panelTarget.classList.remove("is-hidden")
    }

    next() {
        if (this.titles.length === 0) return
        this.index = (this.index + 1) % this.titles.length
        this.render()
    }

    prev() {
        if (this.titles.length === 0) return
        this.index = (this.index - 1 + this.titles.length) % this.titles.length
        this.render()
    }

    // Живое обновление числа над ползунком
    previewValue() {
        const v = parseFloat(this.sliderTarget.value).toFixed(1)
        this.sliderValueTarget.textContent = v
        this.paintSlider()
    }

    // Закрашивает пройденную часть дорожки
    paintSlider() {
        const el = this.sliderTarget
        const pct = ((el.value - el.min) / (el.max - el.min)) * 100
        el.style.setProperty("--fill", `${pct}%`)
    }

    async rate() {
        const title = this.titles[this.index]
        if (!title) return

        const value = parseFloat(this.sliderTarget.value)

        const response = await fetch("/api/values", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ anime_title_id: title.id, value: value })
        })

        const data = await response.json()

        if (response.ok) {
            title.user_value = data.user_value
            title.ave_value = data.ave_value
            title.votes_count = data.votes_count
            this.rateStatusTarget.textContent = ""
            this.renderScore()
            this.renderRating()
        } else {
            this.rateStatusTarget.textContent = data.error || "Ошибка при сохранении"
        }
    }

    changeRating() {
        this.rateScaleTarget.classList.remove("is-hidden")
        this.rateDoneTarget.classList.remove("is-visible")
    }

    renderRating() {
        const title = this.titles[this.index]
        if (!title) return

        if (title.user_value) {
            this.userValueTarget.textContent = title.user_value.toFixed(1)
            this.rateScaleTarget.classList.add("is-hidden")
            this.rateDoneTarget.classList.add("is-visible")
        } else {
            this.sliderTarget.value = 5
            this.previewValue()
            this.rateScaleTarget.classList.remove("is-hidden")
            this.rateDoneTarget.classList.remove("is-visible")
        }
    }

    renderScore() {
        const title = this.titles[this.index]
        if (!title) return

        this.aveValueTarget.textContent =
            title.ave_value != null ? title.ave_value.toFixed(1) : "—"
        this.valuesQtyTarget.textContent = title.votes_count ?? 0
    }

    async toggleFavorite() {
        const title = this.titles[this.index]
        if (!title) return

        const response = await fetch("/api/favorites", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ anime_title_id: title.id })
        })

        if (!response.ok) return

        const data = await response.json()
        title.favorited = data.favorited
        this.renderFavorite()
    }

    renderFavorite() {
        const title = this.titles[this.index]
        if (!title) return

        this.favBtnTarget.classList.toggle("is-active", title.favorited)
    }

    render() {
        const title = this.titles[this.index]
        if (!title) return

        this.imageNameTarget.textContent = title.name
        this.imageTarget.src = `/assets/${encodeURIComponent(title.file)}`
        this.imageTarget.alt = title.name
        this.rateStatusTarget.textContent = ""
        this.renderScore()
        this.renderFavorite()
        this.renderRating()
    }

    clear() {
        this.viewerTarget.classList.add("is-hidden")
        this.panelTarget.classList.add("is-hidden")

        this.imageNameTarget.textContent = ""
        this.imageTarget.removeAttribute("src")
        this.aveValueTarget.textContent = "—"
        this.valuesQtyTarget.textContent = "0"
        this.rateStatusTarget.textContent = ""
        this.rateScaleTarget.classList.remove("is-hidden")
        this.rateDoneTarget.classList.remove("is-visible")
    }

    updateUrl(themeId) {
        const url = new URL(window.location)

        if (themeId) {
            url.searchParams.set("theme_id", themeId)
        } else {
            url.searchParams.delete("theme_id")
        }

        window.history.replaceState({}, "", url)
    }

    switchLocale(event) {
        event.preventDefault()
        const url = new URL(window.location)
        url.searchParams.set("locale", event.currentTarget.dataset.locale)
        window.location = url
    }
}