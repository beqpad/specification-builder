<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
  
  <xsl:template match="/basic_design_specification">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="metadata/project_name"/> - 基本設計書</title>
        <link rel="stylesheet" type="text/css" href="../css/specifications.css"/>
      </head>
      <body>
        <div class="container">
          <div class="header">
            <h1><xsl:value-of select="metadata/project_name"/></h1>
            <div class="subtitle">基本設計書</div>
          </div>

          <div class="metadata">
            <h2>ドキュメント情報</h2>
            <div class="metadata-grid">
              <div class="metadata-item">
                <span class="metadata-label">プロジェクト名</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/project_name != ''">
                      <xsl:value-of select="metadata/project_name"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
              <div class="metadata-item">
                <span class="metadata-label">バージョン</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/version != ''">
                      <xsl:value-of select="metadata/version"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
              <div class="metadata-item">
                <span class="metadata-label">前フェーズ参照</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/previous_phase_reference != ''">
                      <xsl:value-of select="metadata/previous_phase_reference"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
            </div>
          </div>

          <div class="content">
            <xsl:if test="system_overview">
              <div class="section">
                <h2 class="section-header">システム概要</h2>
                <div class="section-content">
                  <div class="subsection">
                    <h3 class="subsection-header">目的</h3>
                    <p><xsl:value-of select="system_overview/purpose"/></p>
                  </div>
                  <div class="subsection">
                    <h3 class="subsection-header">範囲</h3>
                    <p><xsl:value-of select="system_overview/scope"/></p>
                  </div>
                </div>
              </div>
            </xsl:if>

            <xsl:if test="system_architecture/components/component">
              <div class="section">
                <h2 class="section-header">システムアーキテクチャ</h2>
                <div class="section-content">
                  <div class="subsection">
                    <h3 class="subsection-header">アーキテクチャスタイル</h3>
                    <p><xsl:value-of select="system_architecture/architectural_style"/></p>
                  </div>
                  <div class="subsection">
                    <h3 class="subsection-header">コンポーネント</h3>
                    <ul class="item-list">
                      <xsl:for-each select="system_architecture/components/component">
                        <li class="item">
                          <div class="item-header">
                            <span class="item-id"><xsl:value-of select="@id"/></span>
                            <xsl:value-of select="name"/>
                          </div>
                          <div class="item-content">
                            <p><strong>説明:</strong> <xsl:value-of select="description"/></p>
                            <p><strong>責任:</strong> <xsl:value-of select="responsibilities"/></p>
                          </div>
                        </li>
                      </xsl:for-each>
                    </ul>
                  </div>
                </div>
              </div>
            </xsl:if>

            <xsl:if test="data_design/conceptual_model/entity">
              <div class="section">
                <h2 class="section-header">データ設計</h2>
                <div class="section-content">
                  <div class="subsection">
                    <h3 class="subsection-header">概念モデル</h3>
                    <ul class="item-list">
                      <xsl:for-each select="data_design/conceptual_model/entity">
                        <li class="item">
                          <div class="item-header">
                            <span class="item-id"><xsl:value-of select="@id"/></span>
                            <xsl:value-of select="name"/>
                          </div>
                          <div class="item-content">
                            <p><xsl:value-of select="description"/></p>
                          </div>
                        </li>
                      </xsl:for-each>
                    </ul>
                  </div>
                </div>
              </div>
            </xsl:if>
          </div>

          <div class="navigation">
            <div class="nav-links">
              <a href="../requirements/index.html" class="nav-link">← 要件定義</a>
              <a href="../index.html" class="nav-link">目次</a>
              <a href="../detailed-design/index.html" class="nav-link">詳細設計 →</a>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>